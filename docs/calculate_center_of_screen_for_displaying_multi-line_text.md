# Calculate addresses for displaying multi-line text on the center of screen

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
>
> $R_s = \frac{\$19 - n}{\$02}$, for $n >= 2$
>
> where $n$ is the number of rows, counting from 1, and $R_s$ is the starting row.

$C_n = \frac{\$28}{\$02} - \frac{len_n}{\$02}$

$C_n = \frac{\$28 - len_n}{\$02}$

In summary, to find the starting column of a string of text to be displayed in the centre of a row, we have the formula:

> $C_n = \frac{\$28 - len_n}{\$02}$
>
> where $n$ is the row number, starting from 1

Now while these formulas are theoretically correct, they will not produce effective results when using a programmer's calculator, as truncation of the decimal places effect the result at each part of the formula.  Therefore, it's more effective to have a formula that is in the form of steps, as is discussed next.

> $R_s = \$0D - \frac{n}{\$02}$, for $n>=2$, calculate $\frac{n}{\$02}$ first
>
> $R_s = \$0D$, for $n = 1$
>
> where $n$ is the number of text strings

> $C_n = \$14 - \frac{len_n}{\$02}$, calculate $\frac{len_n}{\$02}$ first
>
> where $n$ is the row number, starting from 0

From the point of view of the commodore 64, the above formulas are really just offset into the screen memory array.  So, we actually need to incorporate the aforementioned formulas into a new formula for calculating the extact address of screen memory to locate the start of each text string.

First we need to calculate the starting row.  We have that from the formula for $R_s$ we've defined above. Now, to calculate the screen memory location of the start of that row, we can use this formula:

$R_sC_1 = \$0400 + \$0028 * n$

where $n$ is $R_s-1$, and $R_sC_1$ is the screen memory address of column 1 of the starting (first) row for our set of text lines.

In the previous formula for R, we indexed the rows starting from 1, meaning that first row was row 1, the second row was row 2, etc.  In our new formula, if row 1 was indexed at 1, then when we apply n = 1 into the above formula, we would get the wrong answer.  The very first position on the screen is at address \$0400. So, we'll index n starting from 0.

So, in the formula above, when applying 0 to n, we get \$0400 as the address of the very first character on the screen, which is correct.

So, if $n = R_s - 1$, then

$R_sC_1 = \$0400 + \$0028 * (\$0D - \frac{n}{\$02} - \$01)$

but we're using $n$ in 2 different contexts, the first n being the row number of the screen staring from 0, and the second n being the number of text lines to display to the screen.  Let's not confuse things any further and rename the second n to num_lines.

Therefore,

> $R_sC_1 = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01)$
>
> where $R_sC_1$ represents the starting screen address for Row S, Column 1, and $num\_lines$ represents the number of lines to center on the screen.

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

Now we need to consider the column where the text line will start to make it centered on the row.  Here, we simply add the number of columns (in terms of screen addresses) to the above formula to get the absolute screen address of the first character of the line of text.

We start with our previous formula for column.

> $C_n = \$14 - \frac{len_n}{\$02}$, calculate $\frac{len_n}{\$02}$ first
>
> where $n$ is the row number, starting from 0

This basically says, calculate the column offset, from column 0, of where the first charcter of the text line should appear on the current row.  In other words, imagine the cursor being on column 0 of any row n.  Now, if the text needs to start on the 10th column of that row, the offest from 0 to column 10 would be 9, because we are 0-indexing our series.  For a simple example, if we are on the first row, that would mean that column 0 is at screen address \$0400.  To be at column 10 (when counting from 1, for the first column), we need to add an offset of 9.  The address at column 10 would then be $0409.

So basically the formula for $C_n$ above is for calculating the offest into a row of the screen.

Let's start to rename variables a bit, so that we don't cause confusion.  $i$ will be the current row number of the 40x25 character screen.  The variable $i$ will be between 0 and 24 (for 25 rows). The variable $n$ will be the number of text lines to center on the screen (both vertically and horizontally). So, let's refactor the above column formula:

> $C_i = \$14 - \frac{len_i}{\$02}$
>
> where:
>
> $i$ is the row number, starting from 0
>
> $len_i$ is the length of the text string on row $i$

Let's now do the same thing for the screen address row formula:

$R_iC_1 = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01)$

where $R_iC_1$ represents the starting screen address for the row $i=F$, Column 1, $F$ represts the screen row where the first line will be displayed, and $num\_lines$ represents the number of lines to center on the screen.

Now, we've noticed that the formula is really only for row $F$.  We also need the formula to work for $(F+1)$, $(F+2)$ .... $(F + (num\_lines -1))$.

Ok, but let's back up for a second.  Also, the formula is only for column 1.  Let's first start indexing at column 0, to be consistent with our conventions for starting indexing at 0.  Then, let's add the column offset to start the text at the correct column for the text to be centered on that row.

So, we have:

$R_iC_0 = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01)$

Now adding the offset is just a matter of adding the formula for $C_i$.  Remeber that $i$ here is the row number, not the column number as in $C_0$, where the subscript represents column 0.  Adding $C_i$ to our formula we have:

$R_iC_i = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01) + C_i$

$R_iC_i = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01) + \$14 - \frac{len_i}{\$02}$

Still, this formula is correct only for the first line of text. So, we need to write the formula out for only the first line ($f$).

$R_fC_f = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01) + \$14 - \frac{len_f}{\$02}$

Let's consider what has to be done for the second line of text.  Essentially, we need to advance 1 row from the first line.  This would be like adding 40 columns to column 0 of the first line. We know what the formula for acheiving column 0 is, so we just have to add $0028 to get to the next line, as follows:

$R_{f+1}C_{f+1} = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01) + \$0028 + \$14 - \frac{len_{f+1}}{\$02}$

For the 3rd line, we have:

$R_{f+2}C_{f+2} = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01) + \$0028 + \$0028 + \$14 - \frac{len_{f+2}}{\$02}$

So, we see a pattern where, for every line after the first line, we have to add a multiple of $\$0028$, which is 40 in decimal, which is the number of columns in 1 row. So, how do we formulate this?  Let's refactor the formula again, and this time we want $i$ not to start from the absolute screen row $f$, but from 0, which is the first line in our set of lines.  So, if we have 4 lines of text to display, the first line will be line 0, the second line will be line 1, etc.

That means that our multiple of $\$0028$ can be formalized as $\$0028*i$, or simply $\$0028i$.  Now, let's put the formula together.

$R_iC_i = \$0400 + \$0028 * (\$0D - \frac{num\_lines}{\$02} - \$01) + \$0028i + \$14 - \frac{len_i}{\$02}$

Now that we have the formula, let's try to understand each part again.

$\$0400$ is the starting address of the screen; ie., row 0, column 0.

$(\$0D - \frac{num\_lines}{\$02} - \$01)$ is the center row of the screen menus half the number of lines, and then minus 1, to convert to a 0-indexed scale.  So, this part gives us the row number to put the first line.  To get the absolute address of that row we would need to multiple 40 columns by the row number (or number of rows - 1) and add that to the starting address.  This is because every row has 40 columns, which is the same as saying every row has 40 addresses; so, we need to multiply by the number of rows to get the absolute address.

Once we get to the row for the line to be written, we count the number of columns from the left of the screen that we need to start writting the text for it to be centred.  That's what this part does: $\$14 - \frac{len_i}{\$02}$, which is to say start at the middle of the row and count backwards half the length of the line of text.  By adding those number of columns, we are essentially adding the number of addresses to the address of the beginning of the row.

Lastly, we need a way to move to the next line.  That's what adding $\$0028i$ to the formula does.  Essently, we move 40 columns (40 addresses) and wrap onto the next row. After reasoning through the entire formula, we can feel confident that this formula is sound.  The next thing to really formalize this formula is to put it in sequence notation.  But first, let's change num_lines back to n and this time n will be the number of lines of text.

${(A_i)}_{i=0}^{n-1} = \$0400 + \$0028 * (\$0D - \frac{n}{\$02} - \$01) + \$0028i + \$14 - \frac{len_i}{\$02}$

Therefore,

> To calculate the sequence of addresses needed for centering a set of lines on the C64 screen, we can use this formula:
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
