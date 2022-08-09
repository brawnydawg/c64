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

In summary, to find the starting row of the screen for displaying one or more lines of text, we have:

> $R_s = \$0D$, for $n = 1$
> $R_s = \frac{\$19 - n}{\$02}$, for $n >= 2$
> where $n$ is the number of rows, counting from 1, and $R_s$ is the starting row.

$C_n = \frac{\$28}{\$02} - \frac{len_n}{\$02}$

$C_n = \frac{\$28 - len_n}{\$02}$

In summary, to find the starting column of a string of text to be displayed in the centre of a row, we have the formula:

> $C_n = \frac{\$28 - len_n}{\$02}$
> where $n$ is the row number, starting from 1

Now while these formulas are theoretically correct, they will not produce effective results when using a programmer's calculator, as truncation of the decimal places effect the result at each part of the formula.  Therefore, it's more effective to have a formula that is in the form of steps, as is discussed next.

> $R_s = \$0D - \frac{n}{\$02}$, for $n>=2$, calculate $\frac{n}{\$02}$ first
> $R_s = \$0D$, for $n = 1$
> where $n$ is the number of text strings

> $C_n = \$14 - \frac{len_n}{\$02}$, calculate $\frac{len_n}{\$02}$ first
> where $n$ is the row number, starting from 0

From the point of view of the commodore 64, the above formulas are really just offset into the screen memory array.  So, we actually need to incorporate the aforementioned formulas into a new formula for calculating the extact address of screen memory to locate the start of each text string.

First we need to calculate the starting row.  We have that from the formula for $R_s$ we've defined above. Now, to calculate the screen memory location of the start of that row, we can use this formula:

$R_sC_1 = \$0400 + \$0028 * n$

where $n$ is $R_s-1$, and $R_sC_1$ is the screen memory address of column 1 of the starting (first) row for our set of text lines.

In the previous formula for R, we indexed the rows starting from 1, meaning that first row was row 1, the second row was row 2, etc.  In our new formula, if row 1 was indexed at 1, then when we apply n = 1 into the above formula, we would get the wrong answer.  The very first position on the screen is at address \$0400. So, we'll index n starting from 0.

So, in the formula above, when applying 0 to n, we get \$0400 as the address of the very first character on the screen, which is correct.

So, if $n = R_s - 1$, then

$R_sC_1 = \$0400 + \$0028 * (\$0D - \frac{n}{\$02} - 1)$

but we're using $n$ in 2 different contexts, the first n being the row number of the screen staring from 0, and the second n being the number of text lines to display to the screen.  Let's not confuse things any further and rename the second n to num_lines.

Therefore,

$R_sC_1 = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - 1)$

Let's try the formula for $num\_lines = 4$

If we think in screen locations of 40 columns x 25 rows, then the starting row should start a row 11 \:

$25 / 2 = 13$

$4/2$ = 2

$13 - 2 = 11$

Now $1024 + 40 * (11 - 1) = 1424$

1424 = \$0590

Now let's check the formula to see if the result matches.

$R_sC_1 = \$0400 + \$0028 * (\$0D - \frac{\$04}{\$02} - 1)$

$R_sC_1 = \$0400 + \$0028 * (\$0D - \$02 - 1)$

$R_sC_1 = \$0400 + \$0028 * (\$0A)$

$R_sC_1 = \$0400 + \$0190 = \$0590$

So, the formula works.

Now we need to consider the column where the text line will start to make it centered on the row.

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
