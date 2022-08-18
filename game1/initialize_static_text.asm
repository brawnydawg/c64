#importonce
#import "constants.asm"
#import "data.asm"


// ============================================================
// Initialize the static text on the screen
// ============================================================
init_text:
    ldx #$00            // Initialize the index register with 0
loop_text:              
    lda line1,x         // Read next character from line 1 of text
    sta Line1_Start,x   // Place it on the screen
    lda #$01            // White
    sta Color1_Start,x  // Set foreground colour to whilte
    lda line2,x         // Read next character from line 2 of text
    sta Line2_Start,x   // Place it on the screen
    lda #$01            // White
    sta Color2_Start,x  // Set foregroud colour to white

    inx                 // Increment index
    cpx #$20            // Max length is 32 ($20)
    bne loop_text       // Loop if not at end of longest string
    rts