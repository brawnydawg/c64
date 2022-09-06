// Using Kick Assembler
BasicUpstart2(main)  // 10 sys$0810

#import "constants.asm"

main: 
    sei                     // Set the interrupt disable flag.
    jsr init_screen         // Initialize the screen.
    jsr init_text           // Initialize the text.

    jsr clear_interrupts    // Clear a bunch of system interrupts

    cli                     // Clear the interrupt disable flag.
    jmp *                   // Infinate loop.


#import "data.asm"
#import "initialize_screen.asm"    
#import "initialize_static_text.asm"
#import "clear_interrupts.asm"


    
