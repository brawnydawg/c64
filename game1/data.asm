#importonce

// ============================================================
// Data
// ============================================================

// line 1 starting address for screen ram
// = $0414 + $0028($0C - $01) - $0A
// = $0414 + $01B8 - $0A 
// = $05C2
// line 1 starting address for colour ram
// = $D814 + $01B8 - $0A 
// = $D9C2

// line 2 starting address for screen ram
// = $0414 + $0028($0C - $01) + $0028 - $0010
// = $0414 + $01B8 + $0028 - $0010
// = $05E4
// line 2 starting address for colour ram
// = $D814 + $01B8 + $0028 - $0010
// = $D9E4

line1:
    .text "john palermo presents           "     // len = 21
line2:
    .text "a first program in 6502 assembly"    // len = 32, hex 20