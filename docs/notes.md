# Screen Memory

![](assets/20220803_184746_c64_screen_memory.png)

## Calculate addresses for displaying multi-line text on the center of screen 

> To calculate the sequence of addresses {$A_0,A_1 ... A_{n-1}$} needed for centering $n$ lines of text (numbered $0$ to $n-1$) on the C64 screen, we can use this formula:
>
> ${(A_i)}_{i=0}^{n-1} = \$0414 + \$0028(\$0C - \frac{n}{\$02}) + \$0028i - \frac{len_i}{\$02}$
>
> where
>
> $A_i$ is the screen address of the first character of the string of line $i$
>
> $n$ is the number of lines of text to display
>
> $len_i$ is the length of the string at line $i$

# Colour Memory

![](assets/20220803_185027_c64_colour_memory.png)

# Colour Codes

![](assets/20220802_184606_c64_colour_codes.png)

# VIC Registers

![](assets/20220803_190858_vic_registers.png)

# Screen Codes

![](assets/20220804_153452_vic_screen_codes.png)

# 6502 Instruction Set

https://www.masswerk.at/6502/6502_instruction_set.html
