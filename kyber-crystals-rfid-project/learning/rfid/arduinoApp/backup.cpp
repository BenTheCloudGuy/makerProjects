#include <Arduino.h>
#include <FastLED.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <SPI.h>
#include <MFRC522.h>
#include <WiFiS3.h>
#include <ArduinoHttpClient.h>

// WiFi setup
const char* ssid = "THEMITCHELLFAMILY";
const char* password = "TMFAESSECURITY";

// Azure SQL REST API endpoint (you must create an Azure Function or API to act as a bridge)
const char* sqlApiHost = "YOUR_AZURE_FUNCTION_HOST.azurewebsites.net";
const int sqlApiPort = 443; // HTTPS
const char* sqlApiPath = "/api/rfidlookup"; // Example path

// LED setup
#define LED_PIN     9
#define NUM_LEDS    10
#define LED_TYPE    WS2811
#define COLOR_ORDER GRB

CRGB leds[NUM_LEDS];

// LCD setup
LiquidCrystal_I2C lcd(0x27, 16, 2);

// RFID setup
#define SS_PIN 10
#define RST_PIN 8
MFRC522 mfrc522(SS_PIN, RST_PIN);

// WiFi client and HTTP client
WiFiSSLClient wifiClient;
HttpClient httpClient = HttpClient(wifiClient, sqlApiHost, sqlApiPort);

void showWifiStatus() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("WiFi: ");
  if (WiFi.status() == WL_CONNECTED) {
    lcd.print("Connected");
    lcd.setCursor(0, 1);
    lcd.print(WiFi.localIP());
    Serial.print("[WiFi] Connected. IP: ");
    Serial.println(WiFi.localIP());
  } else {
    lcd.print("NotConnected");
    Serial.println("[WiFi] NotConnected");
  }
  delay(30000); // Show for 30 seconds
}

void showDbStatus(bool success) {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("DB Connection:");
  lcd.setCursor(0, 1);
  if (success) {
    lcd.print("Success");
    Serial.println("[DB] Connection Success");
    delay(30000);
  } else {
    lcd.print("Failed");
    Serial.println("[DB] Connection Failed");
    while (1) delay(100); // Halt if DB connection failed
  }
}

void setup() {
  Serial.begin(115200);
  FastLED.addLeds<LED_TYPE, LED_PIN, COLOR_ORDER>(leds, NUM_LEDS);
  FastLED.clear();
  FastLED.show();

  lcd.init();
  lcd.backlight();
  lcd.clear();

  SPI.begin();
  mfrc522.PCD_Init();

  Serial.println("[Setup] Connecting to WiFi...");
  WiFi.begin(ssid, password);
  unsigned long startAttemptTime = millis();
  while (WiFi.status() != WL_CONNECTED && millis() - startAttemptTime < 20000) {
    delay(500);
  }
  showWifiStatus();

  // Test DB connection (via API)
  bool dbOk = false;
  if (WiFi.status() == WL_CONNECTED) {
    String testUrl = String(sqlApiPath) + "?test=1";
    httpClient.get(testUrl);
    int statusCode = httpClient.responseStatusCode();
    dbOk = (statusCode == 200);
    Serial.print("[DB] Test connection status code: ");
    Serial.println(statusCode);
    httpClient.stop();
  }
  showDbStatus(dbOk);

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Scan RFID Card");
  Serial.println("[Ready] Scan RFID Card");
}

void loop() {
  if (!mfrc522.PICC_IsNewCardPresent() || !mfrc522.PICC_ReadCardSerial()) {
    delay(100);
    return;
  }

  // Get UID as hex string
  String uidStr = "";
  for (byte i = 0; i < mfrc522.uid.size; i++) {
    if (mfrc522.uid.uidByte[i] < 0x10) uidStr += "0";
    uidStr += String(mfrc522.uid.uidByte[i], HEX);
  }
  uidStr.toUpperCase();
  Serial.print("[RFID] Card detected. UID: ");
  Serial.println(uidStr);

  // Query Azure Function API for card info
  String url = String(sqlApiPath) + "?uid=" + uidStr;
  Serial.print("[HTTP] GET: ");
  Serial.println(url);
  httpClient.get(url);
  int statusCode = httpClient.responseStatusCode();
  String response = httpClient.responseBody();
  httpClient.stop();
  Serial.print("[HTTP] Status: ");
  Serial.println(statusCode);
  Serial.print("[HTTP] Response: ");
  Serial.println(response);

  String name = "Unknown";
  String secret = "";
  uint8_t r = 0, g = 0, b = 0;

  if (statusCode == 200) {
    // Parse JSON response (simple/manual, for demo)
    int idxName = response.indexOf("\"Name\":\"");
    int idxSecret = response.indexOf("\"SecretIdentity\":\"");
    int idxRGB = response.indexOf("\"RGBColor\":\"");
    if (idxName > 0) {
      int start = idxName + 8;
      int end = response.indexOf("\"", start);
      name = response.substring(start, end);
    }
    if (idxSecret > 0) {
      int start = idxSecret + 18;
      int end = response.indexOf("\"", start);
      secret = response.substring(start, end);
    }
    if (idxRGB > 0) {
      int start = idxRGB + 12;
      int end = response.indexOf("\"", start);
      String rgbStr = response.substring(start, end);
      int comma1 = rgbStr.indexOf(',');
      int comma2 = rgbStr.lastIndexOf(',');
      r = rgbStr.substring(0, comma1).toInt();
      g = rgbStr.substring(comma1 + 1, comma2).toInt();
      b = rgbStr.substring(comma2 + 1).toInt();
    }
    Serial.print("[RFID] Name: ");
    Serial.println(name);
    Serial.print("[RFID] SecretIdentity: ");
    Serial.println(secret);
    Serial.print("[RFID] RGB: ");
    Serial.print(r); Serial.print(","); Serial.print(g); Serial.print(","); Serial.println(b);
  } else {
    Serial.println("[RFID] Lookup failed or unknown card.");
  }

  // Set LEDs
  fill_solid(leds, NUM_LEDS, CRGB(r, g, b));
  FastLED.show();

  // Display Name and SecretIdentity
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print(name);
  lcd.setCursor(0, 1);
  lcd.print(secret);

  // Wait for next card
  while (mfrc522.PICC_IsNewCardPresent() == false) {
    delay(100);
  }

  // Turn off LEDs and reset display for next scan
  fill_solid(leds, NUM_LEDS, CRGB::Black);
  FastLED.show();
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Scan RFID Card");
  Serial.println("[Ready] Scan RFID Card");
}