# Screen Memory

![](assets/20220803_184746_c64_screen_memory.png)

## Calculate center of screen for displaying text

Number of columns in hex = $\$28$

Number of rows in hex = $\$19$

Number of lines to display = $n$

Length of character string = $len_n$

Center colum for string of text = $C_n$

Row to begin displaying 1 or more lines centered on the screen = $R$

$R = (\frac{\$19}{\$02}) - \frac{n}{\$02}$, for $n>=2$

$R = \frac{\$19 - n}{\$02}$, for $n >= 2$

$R = \$0D$, for $n = 1$

In summary, to find the center row of the screen for displaying one or more lines of text, we have:

> $R = \$0D$, for $n = 1$
> $R = \frac{\$19 - n}{\$02}$, for $n >= 2$
> where n is the number of rows

$C_n = \frac{\$28}{\$02} - \frac{len_n}{\$02}$

$C_n = \frac{\$28 - len_n}{\$02}$

In summary, to find the starting column of a string of text to be displayed in the centre of a row, we have the formula:

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
