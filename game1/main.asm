// Using Kick Assembler
BasicUpstart2(main)  // 10 sys$0810

main: 
    sei         // set the interrupt disable flag
    jsr init_screen
    cli         // clear the interrupt disable flag
    jmp *

// ============================================================
// Initialize the screen
// ============================================================
init_screen:
    




