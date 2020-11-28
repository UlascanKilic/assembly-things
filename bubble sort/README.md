# Bubble Sort

Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order. This algorithm is not suitable for large data sets as its average and worst case complexity are of Ο(n2) where n is the number of items.

<p><strong>Example:</strong><br>
<b>First Pass:</b><br>
( <b>5</b> <b>1</b> 4 2 8 ) –&gt; ( <b>1</b> <b>5</b> 4 2 8 ), Here, algorithm compares the first two elements, and swaps since 5 &gt; 1.<br>
( 1 <b>5</b> <b>4</b> 2 8 ) –&gt;&nbsp; ( 1 <b>4</b> <b>5</b> 2 8 ), Swap since 5 &gt; 4<br>
( 1 4 <b>5</b> <b>2</b> 8 ) –&gt;&nbsp; ( 1 4 <b>2</b> <b>5</b> 8 ), Swap since 5 &gt; 2<br>
( 1 4 2 <b>5</b> <b>8</b> ) –&gt; ( 1 4 2 <b>5</b> <b>8</b> ), Now, since these elements are already in order (8 &gt; 5), algorithm does not swap them.</p>

<p><b>Second Pass:</b><br>
( <b>1</b> <b>4</b> 2 5 8 ) –&gt; ( <b>1</b> <b>4</b> 2 5 8 )<br>
( 1 <b>4</b> <b>2</b> 5 8 ) –&gt; ( 1 <b>2</b> <b>4</b> 5 8 ), Swap since 4 &gt; 2<br>
( 1 2 <b>4</b> <b>5</b> 8 ) –&gt; ( 1 2 <b>4</b> <b>5</b> 8 )<br>
( 1 2 4 <b>5</b> <b>8</b> ) –&gt;&nbsp; ( 1 2 4 <b>5</b> <b>8</b> )<br>
Now, the array is already sorted, but our algorithm does not know if it is completed. The algorithm needs one <b>whole</b> pass without <b>any</b> swap to know it is sorted.</p>

Now, the array is already sorted, but our algorithm does not know if it is completed. The algorithm needs one whole pass without any swap to know it is sorted.

<p><b>Third Pass:</b><br>
( <b>1</b> <b>2</b> 4 5 8 ) –&gt; ( <b>1</b> <b>2</b> 4 5 8 )<br>
( 1 <b>2</b> <b>4</b> 5 8 ) –&gt; ( 1 <b>2</b> <b>4</b> 5 8 )<br>
( 1 2 <b>4</b> <b>5</b> 8 ) –&gt; ( 1 2 <b>4</b> <b>5</b> 8 )<br>
( 1 2 4 <b>5</b> <b>8</b> ) –&gt; ( 1 2 4 <b>5</b> <b>8</b> )</p>


# Variables

```assembly
array		DB	12,4,5,2,7,9,1,8
n 		DW      8
```

# Main
```assembly
                        MOV CX,n
			DEC CX
			
disdongu:	
			XOR DI,DI
			PUSH CX					 		
					
icdongu:	            
			MOV AL, array[DI]
			CMP AL,array[DI+1]
			JNGE arttir
			XCHG AL,array[DI+1]
			MOV array[DI],AL
arttir:		
			INC DI
			LOOP icdongu
			POP CX
			
			LOOP disdongu   

```


As you can see we have an unordered array: 12,4,5,2,7,9,1,8

First, i choose the DI register as a destination index register and push the CX value to stack because there will be two loops, inner loop(icdongu) and outer loop(disdongu). Then put the value of array [DI] into the AL register and compare with array[DI+1]. If array[DI] value is not greater than or equal to array[DI+1] value, jump arttir label.

```assembly
MOV AL, array[DI]
CMP AL,array[DI+1]
JNGE arttir
```

If array[DI] value is greater than or equal to array[DI+1] value, exchange these values.

```assembly
XCHG AL,array[DI+1]
MOV array[DI],AL
```

Here you can see at 076A row, we have a sorted array.

![alt text](https://github.com/UlascanKilic/assembly-things/blob/master/img/bubble1.png)



## License
[MIT](https://choosealicense.com/licenses/mit/)
