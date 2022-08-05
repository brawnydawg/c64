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

    ldx #$00            // Start the index registor at 0
clear:                  // Clear the entire screen
    
    lda #$20            // #$20 is the space character (essentially blank)
    sta $0400,x         // Fill first page of screen with blank
    sta $0500,x         // Fill second page of screen with blank
    sta $0600,x         // Fill third page of screen with blank
    sta $06e8,x         // Fill fourth page (partial page) of screen with blank

    lda #$00            // Store black in A register for setting foreground colour
    sta $d800,x         // Set first page of screen foreground colour to black
    sta $d900,x         // Set second page of screen foreground colour to black
    sta $da00,x         // Set third page of screen foreground colour to black
    sta $dae8,x         // Set fourth page of screen foreground colour to black

    inx                 // Increment x by 1 all the way up to 255.
    bne clear           // If x has not flipped over to 0, continue loop

    rts                 // return from this subroutine


