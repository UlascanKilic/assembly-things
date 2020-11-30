myds		SEGMENT PARA 'veri'
array		DB	12,4,5,2,7,9,1,8
n 			DW  8
key			DB 	0
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
			
			MOV SI,1
			XOR DI,DI
			MOV CX,n
		 	;insertion sort 
fordongu:	        MOV AL, array[SI]
			
			DEC SI
			MOV DI,SI  
		        INC SI
			
whl:		        CMP DI,0
			JNGE L1
			CMP array[DI],AL
			JNG L1
			MOV BL,array[DI]
			MOV array[DI+1],BL
			DEC DI
			JMP whl
			
L1:			MOV array[DI+1],AL			
			
			INC SI
			LOOP fordongu
			
			RETF
MAIN 		ENDP
mycs		ENDS
			END MAIN
