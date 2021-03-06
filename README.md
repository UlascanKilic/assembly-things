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

## Segments
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
<table style="width:100%">
  <tr>
    <th>Flag</th>
    <th></th>
    <th></th>
    <th></th>
    <th></th>
    <th>OF</th>
    <th>DF</th>
    <th>IF</th>
    <th>TF</th>
    <th>SF</th>
    <th>ZF</th>
    <th></th>
    <th>AF</th>
    <th></th>
    <th>PF</th>
    <th></th>
    <th>CF</th>
  </tr>
  <tr>
    <td>Bit</td>
    <td>15</td>
    <td>14</td>
    <td>13</td>
    <td>12</td>
    <td>11</td>
    <td>10</td>
    <td>9</td>
    <td>8</td>
    <td>7</td>
    <td>6</td>
    <td>5</td>
    <td>4</td>
    <td>3</td>
    <td>2</td>
    <td>1</td>
    <td>0</td>
  </tr>
</table>

![alt text](https://github.com/UlascanKilic/assembly-things/blob/master/img/flags.png)

## Variables

The syntax for storage allocation statement for initialized data is 

```assembly
[variable-name]    define-directive    initial-value
```

<table style="width:100%">
  <tr>
    <th>Directive</th>
    <th>Explanation</th>
    <th>Storage</th>
  </tr>
  <tr>
    <td>DB</td>
    <td>Define Byte</td>
    <td>1 Byte</td>
  </tr>
<tr>
    <td>DW</td>
    <td>Define Word</td>
    <td>2 Bytes</td>
  </tr>
<tr>
    <td>DD</td>
    <td>Define Doubleword</td>
    <td>4 Bytes</td>
  </tr>
<tr>
    <td>DQ</td>
    <td>Define Quadword</td>
    <td>8 Bytes</td>
  </tr>
<tr>
    <td>DT</td>
    <td>Define Ten Bytes</td>
    <td>10 Bytes</td>
  </tr>

</table>

```assembly
var1            DB      'a'
var2            DB      25
var3            DW      693FH
var4            DD      12897F3CH
var5            DQ      123456789H
array		DB	12,4,5,2,7,9,1,8 ; Byte type array

```
## 8086 Instructions 

How can you read instruction set of 8086? 
First of all, no need to memorize the all instrucitons. When you need an instruction, you have to open the instruction set first.

<b>DADDR -> </b> Data memory address operands identified<br/>
<b>RB -> </b> Any one of the eight byte registers: AH. AL BH. BL CH. CL DH. or DL<br/>
<b>RW -> </b> Any one of the eight 16-bit registers: AX. BX. CX. DX. SP. BP. SI. or DI<br/>
<b>EA -> </b> Effective data memory address using any of the memory addressing options<br/>
<table style="width:100%">
  <tr>
    <th>Mnemonic</th>
    <th>Operand(s)</th>
    <th>Object Code</th>
    <th>Clock Cycles</th>
    <th>Operation Performed</th>
  </tr>
  <tr>
    <td>MOV</td>
    <td>RW,DADDR</td>
    <td>88 aadddbbb [DISP][DISP]</td>
    <td>8+EA</td>
    <td>[RW] <- [EA]<br/> Load 16 bits of data from the data memory word addressed by DADDR to
register RW</td>    
  </tr>
  <tr>
    <td>ADD</td>
    <td>RB,DADDR</td>
    <td>02 aadddbbb [DISP][DISP] </td>
    <td>9+EA</td>
    <td>[RB] <- [EA] + [RB] <br/> Add the contents of the data byte addressed by DADDR to register RB</td>    
  </tr>
  <tr>
    <td>MUL</td>
    <td>AL,DADDR</td>
    <td>F6 aa100bbb [DISP][DISP] </td>
    <td>(76-83)+EA</td>
    <td>[AX] <- [AL] • [EA]  <br/> Multiply the 8-bit contents of register AL by the contents of the m~mory byte
addressed by DADDR. Treat both numbers as unsigned binary numbers. Store
the 16-bit product in AX </td>    
  </tr>
</table>

<b><i>Check out Instruction Set of 8086 for more</i></b>

### Data Transfer Instructions

<b>MOV</b> − Used to copy the byte or word from the provided source to the provided destination.<br/>

```assembly
MOV AL, FAH; Transfer the hexadecimal value FAH in AL register
MOV BL, 10110100b; Transfer the hexadecimal value 10110100b in BL register
MOV CX, 5; Transfer the octal value 5 in CX register

MOV AL, var1
MOV AH, AL
MOV Myvar, 12

```

Let <b>AX</b> : 4532H = 
```assembly
MOV Myvar, AX; [1001H] = AH = 45H
              ;[1002H] = AL = 32H
```
<table style="width:100%">
  <tr>
    <th>Memory Adress</th>
    <th>Before MOV</th>
    <th>After MOV</th>
  </tr>
  <tr>  
      <td>1003H</td>
       <td>4FH</td>
       <td>4FH</td>
  </tr>
  <tr>  
      <td>1002H</td>
      <td>0ABH</td>
      <td><b>45H</b></td>
  </tr>
  <tr>  
      <td>1001H Myvar -></td>
      <td>53H</td>
      <td><b>32H</b></td>
  </tr>
  <tr>  
      <td>1000H</td>
      <td>2CH</td>
      <td>2CH</td>
  </tr>
</table>


<b>LEA</b> - Loads offset address into the specified register.</br>

```assembly
LEA SI, Myvar ; SI = 1002H
```

<table style="width:100%">
  <tr>
    <th>Memory Adress</th>
    <th>Value</th>
  </tr>
  <tr>  
      <td>1003H</td>
       <td>4FH</td>       
  </tr>
  <tr>  
      <td><b>1002H</b> Myvar -></td>
      <td>0ABH</td>     
  </tr>
  <tr>  
      <td>1001H</td>
      <td>53H</td>     
  </tr>
  <tr>  
      <td>1000H</td>
      <td>2CH</td>  
  </tr>
</table>

<b>XCHG</b> - Exchanges the contents of the 16-bit or 8-bit specified register with the contents of AX register, specified register or memory locations.</br>

```assembly
MOV AX, 1234H; AX = 1234H
MOV BX, 1BCDH; BX = 1BCDH
XCHG AX, BX; AX = 1BCDH and BX = 1234H

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

<table style="width:100%">
  <tr>
    <th>Type</th>
    <th>Multiplied</th>
    <th>Result</th>
  </tr>
  <tr>  
       <td>8 bit</td>
       <td>AL</td>       
       <td>AX=[AH][AL]</td>       
  </tr>

   <tr>  
       <td>16 bit</td>
       <td>AX</td>       
       <td>DX:AX=[DX][AX]</td>       
  </tr>
   <tr>  
       <td>32 bit</td>
       <td>EAX</td>       
       <td>EAX=[EDX][EAX]</td>       
  </tr>
</table>

##### When two bytes are multiplied<br/>

###### The multiplicand is in the AL register, and the multiplier is a byte in the memory or in another register. The product is in AX. High-order 8 bits of the product is stored in AH and the low-order 8 bits are stored in AL.<br/>


```assembly
MOV AL, 10
MOV DL, 25
MUL DL; AL x DL = [AH][AL]

```

##### When two one-word values are multiplied<br/>

###### The multiplicand should be in the AX register, and the multiplier is a word in memory or another register. For example, for an instruction like MUL DX, you must store the multiplier in DX and the multiplicand in AX.<br/>

```assembly
MOV BX, 10
MUL BX; AX x BX = [DX][AX]

```

<b>DIV </b> − Used to divide the unsigned word by byte or unsigned double word by word.<br/>
```assembly
MOV BH, 0F2H; Load numerator in BH  
MOV AL, 4H; Load denominator in AL
DIV BH; Divide BH by AL
```

<b>CMP</b> - CMP is used to compare two operands and the value of the operands does not change as a result of the comparison. Only the result of the flag changes. Conditional branching instructions are used after the CMP.

Its simply does : operand1 - operand2 and you can see the result in the flags.


<table style="width:100%">
  <tr>
    <th>Condition</th>
    <th>Signed Comparison</th>
    <th>Unsigned Comparison</th>
  </tr>
  <tr>  
       <td>opr1 > opr2</td>
       <td>ZF = 0</td>       
       <td>CF = 0 and ZF = 0</td>       
  </tr>

   <tr>  
       <td>opr1 >= opr2</td>
       <td>SF= OF </td>       
       <td>CF = 0</td>       
  </tr>
   <tr>  
       <td>opr1 = opr2</td>
       <td>ZF = 1</td>       
       <td>ZF = 1</td>       
  </tr>
  <tr>  
       <td>opr1 < opr2</td>
       <td>ZF = 1</td>       
       <td>CF = 1 or ZF = 1</td>       
  </tr>
  <tr>  
       <td>opr1 = opr2</td>
       <td>SF != OF</td>       
       <td>CF = 1</td>       
  </tr>
</table>



### Branch Instructions

Conditional execution in assembly language is accomplished by several looping and branching instructions. These instructions can change the flow of control in a program.

#### Unconditional Branch Instructions

Its like 'goto' statement in high level languages.

<b>JMP</b> - The JMP instruction provides a label name where the flow of control is transferred immediately.

In C:

```c++
int main() {

   int i = 10;
   
   goto Label1;
   
   i = 55;
   
Label1:
   printf("%d", i); // i = 10
	
}
   
```

In Assembly:

```assembly
    MOV AL, 10;  
    JMP Label1
    MOV AL, 55;

Label1:
    . ; AL = 10
    .
    .

```

#### Conditional Branch Instructions

This is performed by a set of jump instructions j<condition> depending upon the condition. The conditional instructions transfer the control by breaking the sequential flow and they do it by changing the offset value in IP.
These instruction are used after the CMP.

<table style="width:100%">
  <tr>
    <th>Instruction</th>
    <th>Operands</th>
    <th>Condition</th>
  </tr>
  <tr>  
       <td>JZ/JE</td>
       <td>opr1 - opr2 = 0</td>    
       <td>ZF = 1</td>       
  </tr>

   <tr>  
       <td>JNZ/JNE</td>
       <td>opr1 - opr2 != 0</td>       
       <td>ZF = 0</td>       
  </tr>
   <tr>  
       <td>JS</td>
       <td>opr1 - opr2 < 0</td>          
       <td>SF = 1</td>       
  </tr>
  <tr>  
       <td>JNS</td>
       <td>opr1 - opr2 > 0</td>          
       <td>SF = 0</td>       
  </tr>
  <tr>  
       <td>JO</td>
       <td>opr1 - opr2 = not between 127 and -128</td>       
       <td>OF = 1</td>       
  </tr>
  <tr>  
       <td>JNO</td>
       <td>opr1 - opr2 = between 127 and -128</td>       
       <td>OF = 0</td>       
  </tr>
  <tr>  
       <td>JP/JPE</td>
       <td>Even Parity</td>       
       <td>PF = 1</td>       
  </tr>
  <tr>  
       <td>JNP/JPO</td>
       <td>Odd Parity</td>       
       <td>PF = 0</td>       
  </tr>
</table>

<b>JZ/JE</b> - Jump if op1-op2 = 0 (ZF = 1)</br>
<b>JNZ/JNE</b> - Jump if op1-op2 != 0 (ZF = 0)
```assembly
    MOV AL, 5
    MOV BL, 5
    CMP AL,BL; if statement
    JZ zero; true statement(op1 = op2)
    MOV CX, 10; false statement(op1 != op2)
    JMP exit
zero: ;true statement
    .
    .
    .
exit:
```
<b>JS</b> - Jump if op1-op2 < 0 (SF = 1)</br>
<b>JNS</b> - Jump if op1-op2 > 0 (SF = 0)


```assembly
    MOV AL, 5
    MOV BL, 10
    CMP AL,BL; if statement
    JS sign; true statement (op1 < op2)
    MOV CX, 10; false statement(op1 > op2)
    JMP exit

sign: ;true statement
    .
    .
    .
exit:
```
<b>JO</b> - Jump if op1-op2 is <b>not</b> between 127 and -128</br>
<b>JNO</b> - Jump if op1-op2 is between 127 and -128
```assembly
    MOV AL, -5
    MOV DL, 127
    CMP AL,DL; if statement (-5 - 127 = -132)
    JO overflow; true statement
    MOV BL,12; false statement 
    JMP exit
overflow: ; true statement
    MOV CX,10
exit:  
```

### Conditional branching instructions used with unsigned numbers
When comparing unsigned numbers, it is checked whether one value is above or below the other.

<table style="width:100%">
  <tr>
    <th>Instruction</th>
    <th>Operands</th>
    <th>Condition</th>
  </tr>
  <tr>  
       <td>JB/JNAE/JC</td>
       <td>opr1 - opr2 < 0</td>    
       <td>CF = 1</td>       
  </tr>

   <tr>  
       <td>JA/JNBE</td>
       <td>opr1 - opr2 > 0</td>       
       <td>ZF = 0 and CF = 0</td>       
  </tr>
   <tr>  
       <td>JAE/JNB/JNC</td>
       <td>opr1 - opr2 >= 0</td>          
       <td>CF = 1</td>       
  </tr>
  <tr>  
       <td>JBE/JNA</td>
       <td>opr1 - opr2 <= 0</td>          
       <td>CF = 1 and ZF = 1</td>       
  </tr>
</table>

### Conditional branching instructions used with signed numbers
When comparing signed numbers, it is checked whether one value is greater or less than another.

<table style="width:100%">
  <tr>
    <th>Instruction</th>
    <th>Operands</th>
    <th>Condition</th>
  </tr>
  <tr>  
       <td>JL/JNGE</td>
       <td>opr1 - opr2 < 0</td>    
       <td>SF != OF and ZF = 0</td>       
  </tr>

   <tr>  
       <td>JNL/JGE</td>
       <td>opr1 - opr2 >= 0</td>       
       <td>SF = OF</td>       
  </tr>
   <tr>  
       <td>JLE/JNG </td>
       <td>opr1 - opr2 <= 0</td>          
       <td>SF != OF and ZF = 1</td>       
  </tr>
  <tr>  
       <td>JG/JNLE</td>
       <td>opr1 - opr2 > 0</td>          
       <td>SF = OF and ZF = 0</td>       
  </tr>
</table>


### Stack Instructions

<b>PUSH</b> − Used to put a word at the top of the stack.<br/>
<b>POP</b> − Used to get a word from the top of the stack to the provided location.<br/>
```assembly
MOV CX, 5; CX = 5
PUSH CX; CX = 5
INC CX; CX = 6
POP CX; CX = 5

```


## Adressing Methods

### Immediate Adressing
In this method, the second operand is a number or ASCII value and operand types must be the same.

```assembly
MOV AH, 06H; AH = 06H
MOV CX, 1FFCH; CX = 1FFCH
MOV AL, 'A'; AL = 41H
```

### Register Adressing
Both operands must be registers.

```assembly
MOV AH, AL; AH = AL
MOV CX, AX; CX = AX
```

### Direct Adressing
In direct addressing, the address of the operand is given as a label. This label can be defined as word or byte.

Let the value of myvar variable is 2F00H

<table style="width:100%">
  <tr>
      <th>Memory Block</th>
      <th>Value</th>
  </tr>
  <tr>  
       <td>0004H</td>
       <td>&nbsp; </td>
  </tr>

  <tr>  
      <td>0003H</td>
       <td>2FH</td>
  </tr>
  <tr>  
      <td>0002H myvar -></td>
      <td>00H</td> 
  </tr>

  <tr> 
      <td>0001H</td>
      <td>&nbsp; </td> 
  </tr>
</table>

If 'myvar' defined as a word

```assembly

MOV AX, myvar; AX <- 2F00H
```
If 'myvar' defined as a byte

```assembly

MOV AL, myvar; AL <- 00H
```

## Register Indirect Adressing
In register indirect adressing the address of the operand in memory is indicated by an index register.

<table style="width:100%">
  <tr>
      <th>Memory Block</th>
      <th>Value</th>
  </tr>
  <tr>  
       <td>0004H</td>
       <td>&nbsp; </td>
  </tr>

  <tr>  
      <td>0003H</td>
       <td>4AH</td>
  </tr>
  <tr>  
      <td>0002H <- myvar</td>
      <td>13H</td> 
  </tr>

  <tr> 
      <td>0001H</td>
      <td>&nbsp; </td> 
  </tr>
<tr> 
      <td>0000H</td>
      <td>&nbsp; </td> 
  </tr>
</table>


```assembly

LEA DI, myvar; DI <- 0002H
MOV AX, [DI]; AX <- 4A13H
```

## Direct Index Adressing
In direct index adressing, memory addresses are accessed by an array.<br/>
Let the value of myvar variable is:
```assembly
myvar DB 41H, 53H, 53H,45H, 4DH, 42H, 4CH, 59H ; Byte type variable
```

<table style="width:100%">
  <tr>
      <th>Memory Block</th>
      <th>Value</th>
  </tr>
  <tr>  
       <td>0107H</td>
       <td>59H</td>
  </tr>

  <tr>  
      <td>0106H</td>
       <td>4CH</td>
  </tr>
  <tr>  
      <td>0105H</td>
      <td>42H</td> 
  </tr>

  <tr> 
      <td>0104H</td>
      <td>4DH</td> 
  </tr>
<tr> 
      <td>0103H</td>
      <td>45H</td> 
  </tr>
<tr> 
      <td>0102H</td>
      <td>53H</td> 
  </tr>
<tr> 
      <td>0101H</td>
      <td>53H</td> 
  </tr>
<tr> 
      <td>0100H myvar -> </td>
      <td>41H</td> 
  </tr>
</table>


We can use SI, DI or BX registers as indices to access the myvar array.
If we try to access the first value of the array

```assembly

XOR SI,SI; SI -> 0000H
MOV AL, myvar[SI]; AL <- 41H

;If you try to access next value

INC SI; SI <- 0001H
MOV AH, myvar[SI]; AH <- 53H
```

If we can define myvar as word type

```assembly
myvar DW 5341H,4553H, 424DH, 594CH; Byte type variable
```
Now we have to increase our index by two because now we have a word type array. 

```assembly

;If you increase index by one, you cant access the correct value.

XOR SI,SI; SI -> 0000H
MOV AX, myvar[SI]; AX <- 5341H

INC SI; SI -> 0001H
MOV AX, myvar[SI]; AX <- 5353H 

;If you increase index by two.

XOR SI,SI; SI -> 0000H
MOV AX, myvar[SI]; AX <- 5341H

ADD SI, 2; SI -> 0002H
MOV AX, myvar[SI]; AX <- 4553H
```

## Sorting Algorithms 

####  [Bubble Sort](https://github.com/UlascanKilic/assembly-things/tree/master/bubble%20sort)
####  [Insertion Sort](https://github.com/UlascanKilic/assembly-things/tree/master/insertion%20sort)


## References
https://www.tutorialspoint.com/assembly_programming/
https://www.javatpoint.com/instruction-set-of-8086
