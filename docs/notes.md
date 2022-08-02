# Screen Memory


| Hex Address | Dec Address | Type  | Contents                                                                                                                                                                                                 |
| :------------ | :------------ | :------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $0400-$07E7 | 1024-2023   | Value | 1000 (25 rows, 40 columns) video matrix locations addressed horizontally, then vertically.                                                                                                               |
| $07E8-$07F7 | 2024-2039   |       | Unused                                                                                                                                                                                                   |
| $07F8       | 2040        | Value | Multiplicand for location of[sprite](https://www.c64-wiki.com/wiki/Sprite "Sprite") 0 data block in [memory map](https://www.c64-wiki.com/wiki/Memory_Map "Memory Map"): Value x 64 = data start address |
| $07F9       | 2041        | Value | Multiplicand for location of[sprite](https://www.c64-wiki.com/wiki/Sprite "Sprite") 1 data block in [memory map](https://www.c64-wiki.com/wiki/Memory_Map "Memory Map"): Value x 64 = data start address |
| $07FA       | 2042        | Value | Multiplicand for location of[sprite](https://www.c64-wiki.com/wiki/Sprite "Sprite") 2 data block in [memory map](https://www.c64-wiki.com/wiki/Memory_Map "Memory Map"): Value x 64 = data start address |
| $07FB       | 2043        | Value | Multiplicand for location of[sprite](https://www.c64-wiki.com/wiki/Sprite "Sprite") 3 data block in [memory map](https://www.c64-wiki.com/wiki/Memory_Map "Memory Map"): Value x 64 = data start address |
| $07FC       | 2044        | Value | Multiplicand for location of[sprite](https://www.c64-wiki.com/wiki/Sprite "Sprite") 4 data block in [memory map](https://www.c64-wiki.com/wiki/Memory_Map "Memory Map"): Value x 64 = data start address |
| $07FD       | 2045        | Value | Multiplicand for location of[sprite](https://www.c64-wiki.com/wiki/Sprite "Sprite") 5 data block in [memory map](https://www.c64-wiki.com/wiki/Memory_Map "Memory Map"): Value x 64 = data start address |
| $07FE       | 2046        | Value | Multiplicand for location of[sprite](https://www.c64-wiki.com/wiki/Sprite "Sprite") 6 data block in [memory map](https://www.c64-wiki.com/wiki/Memory_Map "Memory Map"): Value x 64 = data start address |
| $07FF       | 2047        | Value | Multiplicand for location of[sprite](https://www.c64-wiki.com/wiki/Sprite "Sprite") 7 data block in [memory map](https://www.c64-wiki.com/wiki/Memory_Map "Memory Map"): Value x 64 = data start addr    |

# Colour Memory


| Hex Addresd  | Decimal Address | Type | Purpose                                |
| -------------- | ----------------- | ------ | ---------------------------------------- |
| \$D800-$DBE7 | 55296-56295     |      | 1/2 kB (1000 nibbles) of color memory. |
| \$DBE8-$DBFF | 56296-56319     |      | Unused                                 |

# Colour Codes

![](assets/20220802_184606_c64_colour_codes.png)

# VIC Registers
