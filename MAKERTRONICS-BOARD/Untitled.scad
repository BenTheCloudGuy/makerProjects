/*
 * Makeronics Breadboard Mount
 *
 * Mounting base for:
 *   - Makeronics 3220-Point Solderless Breadboard (237 x 205 mm metal plate)
 *   - Raspberry Pi 5 (85 x 56 mm)
 *   - Arduino GIGA R1 WiFi (101.60 x 53.34 mm)
 *
 * Layout: Breadboard recess on top, Pi 5 and GIGA R1 side-by-side below.
 */

// ============================================================
// PARAMETERS
// ============================================================

// --- Base plate ---
base_thickness = 3;           // mm

// --- Breadboard metal plate ---
bb_w = 237;                   // width (mm)
bb_d = 205;                   // depth (mm)

// Breadboard corner screw holes
bb_hole_dia    = 5;           // 5 mm diameter holes
bb_hole_inset  = 5;           // hole center 5 mm from each edge
bb_support_h   = 10;          // screw-support post height
bb_support_dia = 12;          // post outer diameter (M5 + wall)

// Perimeter retaining wall
wall_h = 15;                  // wall height (from base top surface)
wall_t = 3;                   // wall thickness

// --- Raspberry Pi 5 ---
pi_w          = 85;
pi_d          = 56;
pi_hole_dia   = 3.0;         // M3 mounting holes
pi_hole_inset = 3.5;         // hole inset from board edges
pi_h_spacing  = 58;          // horizontal hole center-to-center
pi_v_spacing  = 49;          // vertical hole center-to-center
pi_standoff_h = 8;           // standoff height
pi_standoff_od = 6;          // standoff outer diameter

// --- Arduino GIGA R1 WiFi ---
giga_w          = 101.60;
giga_d          = 53.34;
giga_hole_dia   = 3.2;       // Ø3.20 mm mounting holes
// 4 corner mounting holes derived from mechanical drawing
// Left holes at 15.24 mm from left, right holes at 15.24 + 74.93 = 90.17 mm
// Top holes at 2.54 mm from top, bottom holes at 53.34 - 2.25 = 51.09 mm
giga_hole1 = [15.24, 2.54];                    // top-left
giga_hole2 = [15.24 + 74.93, 2.54];            // top-right
giga_hole3 = [15.24, giga_d - 2.25];           // bottom-left
giga_hole4 = [15.24 + 74.93, giga_d - 2.25];   // bottom-right
giga_standoff_h  = 8;
giga_standoff_od = 6;

// --- Layout ---
board_clearance = 10;         // clearance around each dev board
section_gap     = 10;         // gap between breadboard section and boards
board_gap       = 5;          // gap between Pi and GIGA envelopes

// ============================================================
// COMPUTED LAYOUT
// ============================================================

// Breadboard section outer dimensions (including walls)
bb_section_w = bb_w + 2 * wall_t;
bb_section_d = bb_d + 2 * wall_t;

// Board envelopes (board + clearance on each side)
pi_env_w   = pi_w + 2 * board_clearance;
pi_env_d   = pi_d + 2 * board_clearance;
giga_env_w = giga_w + 2 * board_clearance;
giga_env_d = giga_d + 2 * board_clearance;

// Total base dimensions
total_w = bb_section_w;
boards_row_d = max(pi_env_d, giga_env_d);
total_d = bb_section_d + section_gap + boards_row_d;

// Center the boards row horizontally under the breadboard
boards_total_w = pi_env_w + board_gap + giga_env_w;
boards_offset_x = (total_w - boards_total_w) / 2;

// Envelope positions (bottom-left corners)
pi_env_x = boards_offset_x;
pi_env_y = bb_section_d + section_gap;

giga_env_x = pi_env_x + pi_env_w + board_gap;
giga_env_y = bb_section_d + section_gap;

// Actual board origins (within envelopes)
pi_x = pi_env_x + board_clearance;
pi_y = pi_env_y + (boards_row_d - pi_d) / 2;

giga_x = giga_env_x + board_clearance;
giga_y = giga_env_y + (boards_row_d - giga_d) / 2;

// Resolution
$fn = 48;

// ============================================================
// MODULES
// ============================================================

module base_plate() {
    // Main base slab with rounded corners
    corner_r = 3;
    translate([corner_r, corner_r, 0])
        minkowski() {
            cube([total_w - 2*corner_r, total_d - 2*corner_r, base_thickness/2]);
            cylinder(r=corner_r, h=base_thickness/2);
        }
}

module breadboard_walls() {
    // Raised perimeter wall creating a recess for the metal plate
    translate([0, 0, base_thickness]) {
        difference() {
            cube([bb_section_w, bb_section_d, wall_h]);
            // Hollow out interior
            translate([wall_t, wall_t, -1])
                cube([bb_w, bb_d, wall_h + 2]);
        }
    }
}

module breadboard_supports() {
    // 4 corner screw-support posts with M5 through-holes
    positions = [
        [bb_hole_inset, bb_hole_inset],
        [bb_w - bb_hole_inset, bb_hole_inset],
        [bb_hole_inset, bb_d - bb_hole_inset],
        [bb_w - bb_hole_inset, bb_d - bb_hole_inset]
    ];

    for (pos = positions) {
        translate([wall_t + pos[0], wall_t + pos[1], base_thickness]) {
            difference() {
                cylinder(h = bb_support_h, d = bb_support_dia);
                translate([0, 0, -1])
                    cylinder(h = bb_support_h + 2, d = bb_hole_dia);
            }
        }
    }
}

module standoff(height, od, hole_dia) {
    difference() {
        cylinder(h = height, d = od);
        translate([0, 0, -1])
            cylinder(h = height + 2, d = hole_dia);
    }
}

module pi_standoffs() {
    // Raspberry Pi 5: 4 mounting holes
    pi_holes = [
        [pi_hole_inset, pi_hole_inset],
        [pi_hole_inset + pi_h_spacing, pi_hole_inset],
        [pi_hole_inset, pi_hole_inset + pi_v_spacing],
        [pi_hole_inset + pi_h_spacing, pi_hole_inset + pi_v_spacing]
    ];

    for (h = pi_holes) {
        translate([pi_x + h[0], pi_y + h[1], base_thickness])
            standoff(pi_standoff_h, pi_standoff_od, pi_hole_dia);
    }
}

module giga_standoffs() {
    // Arduino GIGA R1 WiFi: 4 corner mounting holes
    giga_holes = [giga_hole1, giga_hole2, giga_hole3, giga_hole4];

    for (h = giga_holes) {
        translate([giga_x + h[0], giga_y + h[1], base_thickness])
            standoff(giga_standoff_h, giga_standoff_od, giga_hole_dia);
    }
}

module board_outline(w, d, ox, oy) {
    // Thin raised ridge showing board placement
    ridge_h = 0.6;
    ridge_w = 0.8;
    translate([ox, oy, base_thickness]) {
        cube([w, ridge_w, ridge_h]);                              // bottom
        translate([0, d - ridge_w, 0]) cube([w, ridge_w, ridge_h]); // top
        cube([ridge_w, d, ridge_h]);                              // left
        translate([w - ridge_w, 0, 0]) cube([ridge_w, d, ridge_h]); // right
    }
}

module cable_slots() {
    // Small cable-routing slots in the breadboard wall (front and back)
    slot_w = 15;
    slot_h = wall_h - 5;   // leave 5 mm of wall at the top
    slot_depth = wall_t + 2;

    // Front wall (y=0 side) - center slot
    translate([bb_section_w/2 - slot_w/2, -1, base_thickness + (wall_h - slot_h)])
        cube([slot_w, slot_depth, slot_h + 1]);

    // Back wall (y=bb_section_d side) - center slot
    translate([bb_section_w/2 - slot_w/2, bb_section_d - wall_t - 1, base_thickness + (wall_h - slot_h)])
        cube([slot_w, slot_depth + 2, slot_h + 1]);

    // Left wall - center slot
    translate([-1, bb_section_d/2 - slot_w/2, base_thickness + (wall_h - slot_h)])
        cube([slot_depth, slot_w, slot_h + 1]);

    // Right wall - center slot
    translate([bb_section_w - wall_t - 1, bb_section_d/2 - slot_w/2, base_thickness + (wall_h - slot_h)])
        cube([slot_depth + 2, slot_w, slot_h + 1]);
}

// ============================================================
// LABELS (engraved text)
// ============================================================

module labels() {
    label_depth = 0.8;

    // "Pi 5" label
    translate([pi_x + pi_w/2, pi_y - 5, base_thickness + label_depth])
        rotate([0, 180, 0])
            linear_extrude(height = label_depth + 0.1)
                text("Pi 5", size = 5, halign = "center", valign = "center");

    // "GIGA R1" label
    translate([giga_x + giga_w/2, giga_y - 5, base_thickness + label_depth])
        rotate([0, 180, 0])
            linear_extrude(height = label_depth + 0.1)
                text("GIGA R1", size = 5, halign = "center", valign = "center");
}

// ============================================================
// ASSEMBLY
// ============================================================

difference() {
    union() {
        // Base slab
        base_plate();

        // Breadboard section
        breadboard_walls();
        breadboard_supports();

        // Dev-board standoffs
        pi_standoffs();
        giga_standoffs();

        // Board placement outlines
        board_outline(pi_w, pi_d, pi_x, pi_y);
        board_outline(giga_w, giga_d, giga_x, giga_y);
    }

    // Subtract cable slots and labels
    cable_slots();
    labels();
}

// ============================================================
// DIMENSIONS ECHO (for verification)
// ============================================================
echo(str("Total base: ", total_w, " x ", total_d, " x ", base_thickness, " mm"));
echo(str("Breadboard section: ", bb_section_w, " x ", bb_section_d, " mm"));
echo(str("Pi 5 origin: (", pi_x, ", ", pi_y, ")"));
echo(str("GIGA R1 origin: (", giga_x, ", ", giga_y, ")"));

