myds		SEGMENT PARA 'veri'
array		DB	12,4,5,2,7,9,1,8
n 			DW  8
myds		ENDS
myss		SEGMENT PARA STACK 'yigin'
			DW 20 DUP(?)
myss		ENDS
mycs		SEGMENT PARA 'kod'
			ASSUME CS:mycs, SS:myss, DS:myds			
MAIN		PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, myds
			MOV DS, AX
			
			XOR SI,SI
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
			INC SI 
			
			LOOP disdongu   
			
			RETF
MAIN 		ENDP
mycs		ENDS
			END MAIN