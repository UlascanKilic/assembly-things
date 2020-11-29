# Hello 8086 Assembly



Assembly language is a low-level programming language for a computer or other programmable device specific to a particular computer architecture in contrast to most high-level programming languages, which are generally portable across multiple systems.



![alt text](https://github.com/UlascanKilic/assembly-things/blob/master/img/asmregisters.gif)



## General Registers


<b>AX</b> Accumulator - the accumulator register (divided into AH / AL).</br>
<b>BX</b> Base - the base address register (divided into BH / BL).</br>
<b>CX</b> Counter- the count register (divided into CH / CL).</br>
<b>DX</b> Data - the data register (divided into DH / DL).</br>


## Offset Registers

<b>IP</b> Instruction pointer - Current instruction offset</br>
<b>SP</b> Stack pointer - Current stack offset</br>
<b>BP</b> Base pointer - Base for referencing values stored on stack</br>
<b>SI</b> Source index - General addressing, source offset in string ops</br>
<b>DI</b> Destination index - General addressing, destination in string ops</br>

## Segment Registers
<b>CS</b> Code segment - Segment to which IP refers</br>
<b>SS</b> Stack segment - Segment to which SP refers</br>
<b>DS</b> Data segment - General addressing, usually for program's data area</br>
<b>ES</b> Extra segment - General addressing, destination segment in string ops</br>


## Flags

<b>OF</b> Overflow flag - Indicates a signed arithmetic overflow occurred</br>
<b>DF</b> Direction flag - Controls incr. direction in string ops (0=inc, 1=dec)</br>
<b>IF</b> Interrupt flag - Controls whether interrupts are enabled</br>
<b>TF</b> Trap flag - Controls debug interrupt generation after instructions</br>
<b>SF</b> Sign flag - Indicates a negative result or comparison</br>
<b>ZF</b> Zero flag -Indicates a zero result or an equal comparison</br>
<b>AF</b> Auxiliary flag - Indicates adjustment is needed after BCD arithmetic</br>
<b>PF</b> Parity flag - Indicates an even number of 1 bits</br>
<b>CF</b> Carry flag - Indicates an arithmetic carry occurred</br>

![alt text](https://github.com/UlascanKilic/assembly-things/blob/master/img/flags.png)

## Variables

```assembly
array		DB	12,4,5,2,7,9,1,8 ; Byte type array
x		DW      3 ; Word type variable
```
## 8086 Instructions 

<b><i>Check out Instruction Set of 8086 for more</i></b>

### Data Transfer Instructions
<b>MOV</b> − Used to copy the byte or word from the provided source to the provided destination.<br/>
```assembly
MOV AL, FAH; Transfer the hexadecimal value FAH in AL register
MOV BL, 10110100b; Transfer the hexadecimal value 10110100b in BL register
MOV CX, 5; Transfer the octal value 5 in CX register
```


<b>PUSH</b> − Used to put a word at the top of the stack.<br/>
<b>POP</b> − Used to get a word from the top of the stack to the provided location.<br/>
```assembly
MOV CX, 5; CX = 5
PUSH CX; CX = 5
INC CX; CX = 6
POP CX; CX = 5

```

### Arithmetic Instructions

<b>ADD</b> − Used to add the provided byte to byte/word to word.<br/>
<b>SUB</b> − Used to subtract the byte from byte/word from word.<br/>
```assembly
MOV AL,0FEh; AL = 0FEh
ADD AL,1; AL = AL + 1 -> AL = 0FFh
SUB AL,1; AL = AL - 1 -> AL = 0FEh

```

<b>INC</b> − Used to increment the provided byte/word by 1.<br/>
<b>DEC</b> − Used to decrement the provided byte/word by 1.<br/>
```assembly
MOV CX, 5; CX = 5
INC CX; CX = 6
DEC CX; CX = 5
```

<b>MUL</b> − Used to multiply unsigned byte by byte/word by word.<br/>
##### When two bytes are multiplied<br/>

###### The multiplicand is in the AL register, and the multiplier is a byte in the memory or in another register. The product is in AX. High-order 8 bits of the product is stored in AH and the low-order 8 bits are stored in AL.<br/>

##### When two one-word values are multiplied<br/>

###### The multiplicand should be in the AX register, and the multiplier is a word in memory or another register. For example, for an instruction like MUL DX, you must store the multiplier in DX and the multiplicand in AX.<br/>

```assembly
MOV AL, 10
MOV DL, 25
MUL DL; AL x DL = [AH][AL]

```

<b>DIV </b> − Used to divide the unsigned word by byte or unsigned double word by word.<br/>
```assembly
MOV BH, 0F2H; Load numerator in BH  
MOV AL, 4H; Load denominator in AL
DIV BH; Divide BH by AL
```



## Sorting Algorithms 

####  [Bubble Sort](https://github.com/UlascanKilic/assembly-things/tree/master/bubble%20sort)
####  [Insertion Sort](https://github.com/UlascanKilic/assembly-things/tree/master/insertion%20sort)


## License
[MIT](https://choosealicense.com/licenses/mit/)
