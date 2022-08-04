// Using Kick Assembler
BasicUpstart2(main)  // 10 sys$0810

main: 
    sei                 // Set the interrupt disable flag.
    jsr init_screen     // Initialize the screen.
    cli                 // Clear the interrupt disable flag.
    jmp *               // Infinate loop.

// ============================================================
// Initialize the screen
// ============================================================
init_screen:
    
    lda #$00            // Store black in register.
    sta $d021           // $d021 is the background colour register.
    sta $d020           // $d020 is the border colour register.

clear:                  // Clear the entire screen
    
    rts


