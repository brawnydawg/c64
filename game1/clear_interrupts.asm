#importonce

clear_interrupts:
    ldy #$7f            // $7f = %01111111
    sty $dc0d           // Turn off CIAs Timer interrupts
    sty $dd0d           // Turn off CIAs Timer interrupts
    lda $dc0d           // cancel all CIA-IRQs in queue/unprocessed
    lda $dd0d           // cancel all CIA-IRQs in queue/unprocessed

    rts                 // return from this subroutine