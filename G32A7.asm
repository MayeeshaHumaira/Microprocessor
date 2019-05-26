G32A7 SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:G32A7
ORG 1000H

START:    
    MOV AL,80H
    OUT 1EH,AL
    OUT 1FH,AL
		      
    MOV AL,0FFH
    OUT 19H,AL
	 
AGAIN:
	MOV SI,OFFSET DATA    
  	MOV BX, 010H	   
	       
TOP:	   
	MOV AL,BYTE PTR CS:[SI]
	OUT 18H,AL          
	INC SI

	MOV AL,BYTE PTR CS:[SI]
	OUT 1AH,AL                   
	INC SI

	MOV AL,BYTE PTR CS:[SI]
	OUT 1CH,AL 
	INC SI

	DEC BX

	;Delay
	MOV CX,01FFH
	L1:LOOP L1

	;Delay
	MOV CX,01FFH
	L2:LOOP L2	   
	              
	CMP BX,0AH	
	JA GREEN

	CMP BX,08H	
	JA ORANGE

	CMP BX,02H	
	JA RED

	CMP BX,0H	
	JA GREEN

	JMP AGAIN2
	

GREEN:
	MOV AL, 02H
	OUT 1BH,AL
	
	;Delay
    MOV CX,04FFH
	L5:LOOP L5
	 
	JMP TOP
	
ORANGE:
	MOV AL, 05H
	OUT 1BH,AL
	
	;Delay
    MOV CX,04FFH
    L3:LOOP L3
	   
	JMP TOP

RED:
	MOV AL,01H
	OUT 1BH,AL
	
	;Delay
    MOV CX,04FFH
    L4:LOOP L4
	   
	JMP TOP


AGAIN2:
	MOV SI,OFFSET DATA    
  	MOV BX, 010H	   
	       
TOP2:	   
	MOV AL,BYTE PTR CS:[SI]
	OUT 18H,AL          
	INC SI

	MOV AL,BYTE PTR CS:[SI]
	OUT 1AH,AL                   
	INC SI

	MOV AL,BYTE PTR CS:[SI]
	OUT 1CH,AL 
	INC SI

	DEC BX

	;Delay
	MOV CX,0FH
	L6:LOOP L6
  
	CMP BX,0AH	
	JA GREEN2

	CMP BX,08H	
	JA ORANGE2

	CMP BX,02H	
	JA RED2

	CMP BX,0H	
	JA GREEN2

	JMP AGAIN2
	

GREEN2:
	MOV AL, 02H
	OUT 1BH,AL
	
	;Delay
    MOV CX,0FH
	L7:LOOP L7
	 
	JMP TOP2
	
ORANGE2:
	MOV AL, 05H
	OUT 1BH,AL
	
	;Delay
    MOV CX,0FH
    L8:LOOP L8
	   
	JMP TOP2

RED2:
	MOV AL,01H
	OUT 1BH,AL
	
	;Delay
    MOV CX,0FH
    L9:LOOP L9
	   
	JMP TOP2

		
DATA:
	;POINT 1 G R5 C6
	DB 0DFH
	DB 0FFH	
	DB 040H
	;POINT 2 G R5 C5
	DB 0DFH
	DB 0FFH	
	DB 020H
	;POINT 3 G R5 C4
	DB 0DFH
	DB 0FFH	
	DB 010H
	;POINT 4 G R5 C3
	DB 0DFH
	DB 0FFH	
	DB 08H
	;POINT 5 G R5 C2
	DB 0DFH
	DB 0FFH	
	DB 04H
	;POINT 6 G R5 C1
	DB 0DFH
	DB 0FFH	
	DB 02H


	;POINT 7 O R4 C0
	DB 0EFH
	DB 0EFH	
	DB 01H
	;POINT 8 O R3 C0
	DB 0F7H
	DB 0F7H	
	DB 01H


	;POINT 9 R R2 C1
	DB 0FFH
	DB 0FBH	
	DB 02H
	;POINT 10 R R2 C2
	DB 0FFH
	DB 0FBH	
	DB 04H
	;POINT 11 R R2 C3
	DB 0FFH
	DB 0FBH	
	DB 08H
	;POINT 12 R R2 C4
	DB 0FFH
	DB 0FBH	
	DB 010H
	;POINT 13 R R2 C5
	DB 0FFH
	DB 0FBH	
	DB 020H
	;POINT 14 R R2 C6
	DB 0FFH
	DB 0FBH	
	DB 040H


	;POINT 15 G R3 C7
	DB 0F7H
	DB 0FFH	
	DB 080H
	;POINT 16 G R4 C7
	DB 0EFH
	DB 0FFH	
	DB 080H

	
G32A7 ENDS
    END START