#importonce 

#import "data_colourwash.asm"  //import the data used in this include.

colwash1:
    ldx #$27        // Load x-register with 39 to start at index 39 (0-39) of the colour wash table.
    lda colour1+$27 // Get last value of colour wash table colour1.

cycle1:

