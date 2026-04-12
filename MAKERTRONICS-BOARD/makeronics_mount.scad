/*
 * Makeronics Breadboard Mount
 *
 * Mounting base for:
 *   - Makeronics 3220-Point Solderless Breadboard
 *   - Raspberry Pi 5 
 *   - Arduino GIGA R1 WiFi
 */

// ============================================================
//         VARIABLES FOR BASE PLATE AND COMPONENTS
// ============================================================

// --- Base plate ---
base_thickness = 5;           // base plate thickness (mm)

// --- Breadboard metal plate ---
bb_w = 238;                   // width (mm)
bb_d = 209;                   // depth (mm)

// Breadboard corner screw holes
bb_hole_dia    = 5;           // 5 mm diameter holes (ie M5 Screw)
bb_hole_inset  = 8;           // hole center 8 mm from each edge
bb_support_h   = 10;          // screw-support post height
bb_support_dia = 12;          // post outer diameter (M5 + wall)

// Perimeter retaining wall
wall_h = 20;                  // wall height (from base top surface)
wall_t = 3;                   // wall thickness

// --- Raspberry Pi 5 ---
pi_w          = 85;
pi_d          = 56;
pi_hole_dia   = 5;           // M3 mounting holes
pi_hole_inset = 3.5;         // hole inset from board edges
pi_h_spacing  = 58;          // horizontal hole center-to-center
pi_v_spacing  = 49;          // vertical hole center-to-center
pi_standoff_h = 8;           // standoff height
pi_standoff_od = 6;          // standoff outer diameter

// --- Arduino GIGA R1 WiFi ---
giga_w          = 101.60;
giga_d          = 53.34;
giga_hole_dia   = 3.2;       // Ø3.20 mm mounting holes
// Mega form-factor mounting holes (from Arduino Eagle PCB files).
// NOTE: the 4 outer holes are NOT rectangular — X offsets differ per side.
// Origin = bottom-left corner of PCB, USB connector on left.
giga_hole1 = [13.97,  2.54];                   // bottom-left  (near USB)
giga_hole2 = [96.52,  2.54];                   // bottom-right (far end)
giga_hole3 = [15.24, 50.80];                   // top-left     (near USB)
giga_hole4 = [90.17, 50.80];                   // top-right    (far end)
giga_standoff_h  = 8;
giga_standoff_od = 6;

// --- Layout ---
board_clearance = 10;         // clearance around each dev board
section_gap     = 10;         // gap between breadboard section and boards
board_gap       = 5;          // gap between Pi and GIGA envelopes

// ============================================================
//                     LAYOUT OF STUFF
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
giga_env_x = boards_offset_x;
giga_env_y = bb_section_d + section_gap;

pi_env_x = giga_env_x + giga_env_w + board_gap;
pi_env_y = bb_section_d + section_gap;

// Board origins — GIGA LEFT (rotated 180°), Pi RIGHT (rotated 180°)
// GIGA rotated: USB now on right edge, facing Pi
// Pi rotated: USB now on left edge, facing GIGA
// Inset each board so cone bases (radius = standoff_h) don't overhang the plate
cone_r = pi_standoff_h;   // 8 mm — same for both boards

// GIGA: nearest rotated hole to board edge is 5.08 mm (x) and 2.54 mm (y)
giga_inset_x = cone_r - 5.08;                                      // ~2.92 mm
giga_inset_y = cone_r - 2.54;                                      // ~5.46 mm
giga_x = giga_inset_x;                                             // near left edge
giga_y = total_d - giga_d - giga_inset_y;                          // near bottom edge

// Pi: nearest rotated hole to board edge is 3.5 mm (both axes)
pi_inset_x = cone_r - pi_hole_inset;                               // 4.5 mm
pi_inset_y = cone_r - pi_hole_inset;                               // 4.5 mm
pi_x   = total_w - pi_w - pi_inset_x;                              // near right edge
pi_y   = total_d - pi_d - pi_inset_y;                              // near bottom edge

// Resolution
$fn = 48;

// ============================================================
//               HERE IS WHERE THE FUN BEGINS
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

module cone_standoff(height, top_od, hole_dia) {
    // Cone-shaped mount: base diameter = 2 * height (as wide as tall)
    base_dia = 2 * height;
    difference() {
        cylinder(h = height, d1 = base_dia, d2 = top_od);
        translate([0, 0, -1])
            cylinder(h = height + 2, d = hole_dia);
    }
}

module pi_standoffs() {
    // Raspberry Pi 5: 4 mounting holes (rotated 180°, USB-A now on left edge)
    pi_holes = [
        [pi_w - pi_hole_inset, pi_d - pi_hole_inset],
        [pi_w - pi_hole_inset - pi_h_spacing, pi_d - pi_hole_inset],
        [pi_w - pi_hole_inset, pi_d - pi_hole_inset - pi_v_spacing],
        [pi_w - pi_hole_inset - pi_h_spacing, pi_d - pi_hole_inset - pi_v_spacing]
    ];

    for (h = pi_holes) {
        translate([pi_x + h[0], pi_y + h[1], base_thickness])
            cone_standoff(pi_standoff_h, pi_standoff_od, pi_hole_dia);
    }
}

module giga_standoffs() {
    // Arduino GIGA R1 WiFi: 4 mounting holes (rotated 180°, USB now on right edge)
    giga_holes_rotated = [
        [giga_w - giga_hole1[0], giga_d - giga_hole1[1]],
        [giga_w - giga_hole2[0], giga_d - giga_hole2[1]],
        [giga_w - giga_hole3[0], giga_d - giga_hole3[1]],
        [giga_w - giga_hole4[0], giga_d - giga_hole4[1]]
    ];

    for (h = giga_holes_rotated) {
        translate([giga_x + h[0], giga_y + h[1], base_thickness])
            cone_standoff(giga_standoff_h, giga_standoff_od, giga_hole_dia);
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

    // Subtract cable slots
    cable_slots();
}
