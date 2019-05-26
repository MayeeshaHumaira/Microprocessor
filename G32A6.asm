G32A6 SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:G32A6
ORG 1000H

START:
    MOV AL,80H
    OUT 1EH,AL
    OUT 1FH,AL
		
AGAIN: 
	MOV SI,OFFSET DATA    
	MOV DX, 010H	   
	MOV BX,OFFSET DATA1		
		   		  
	       
TOP:	   
    MOV AL,BYTE PTR CS:[SI]
    OUT 18H,AL		   
	MOV AL,BYTE PTR CS:[BX]
	OUT 19H,AL	  
       
	INC SI          
	INC BX
           
		   
    MOV AL,BYTE PTR CS:[SI]
    OUT 1AH,AL		   
	MOV AL,BYTE PTR CS:[BX]
	OUT 19H,AL   
    
	INC SI          
	INC BX
	   
       
    MOV AL,BYTE PTR CS:[SI]
    OUT 1CH,AL		   
	MOV AL,BYTE PTR CS:[BX]	   
	OUT 19H,AL	   
       	
	INC SI		   
	INC BX
	DEC DX
	   		  
	   
    ;Delay
    MOV CX,01FFFH
    L1:LOOP L1
	
	;Delay
    MOV CX,01FFFH
    L2:LOOP L2
	   		   
                            
	CMP DX,0H	
    JE AGAIN1
    JMP TOP



AGAIN1: 
	MOV SI,OFFSET DATA    
	MOV DX, 010H	   
	MOV BX,OFFSET DATA1		
		   		  
	       
TOP1:	   
    MOV AL,BYTE PTR CS:[SI]
    OUT 18H,AL		   
	MOV AL,BYTE PTR CS:[BX]
	OUT 19H,AL	  
       
	INC SI          
	INC BX
           
		   
    MOV AL,BYTE PTR CS:[SI]
    OUT 1AH,AL		   
	MOV AL,BYTE PTR CS:[BX]
	OUT 19H,AL   
    
	INC SI          
	INC BX
	   
       
    MOV AL,BYTE PTR CS:[SI]
    OUT 1CH,AL		   
	MOV AL,BYTE PTR CS:[BX]	   
	OUT 19H,AL	   
       	
	INC SI		   
	INC BX
	DEC DX
	   		  
	
	;Delay
    MOV CX,0FFH
    L3:LOOP L3
	   		   
                            
	CMP DX,0H	
    JE AGAIN1
    JMP TOP1


DATA1:

	; POINT 1 SHOW 5
	DB 092H
	DB 092H
	DB 092H
	; POINT 2 SHOW 5
	DB 092H
	DB 092H
	DB 092H
	; POINT 3 SHOW 5
	DB 092H
	DB 092H
	DB 092H
	;  POINT 4 SHOW 5
	DB 092H
	DB 092H
	DB 092H
	;  POINT 5 SHOW 5
	DB 092H
	DB 092H
	DB 092H
	;  POINT 6 SHOW 5
	DB 092H
	DB 092H
	DB 092H



	;  POINT 7 SHOW 0
	DB 0C0H
	DB 0C0H
	DB 0C0H
	;  POINT 8 SHOW 0
	DB 0C0H
	DB 0C0H
	DB 0C0H



	;  POINT 9 SHOW 2
	DB 0A4H
	DB 0A4H
	DB 0A4H
	;  POINT 10 SHOW 2
	DB 0A4H
	DB 0A4H
	DB 0A4H
	;  POINT 11 SHOW 2
	DB 0A4H
	DB 0A4H
	DB 0A4H
	;  POINT 12 SHOW 2
	DB 0A4H
	DB 0A4H
	DB 0A4H
	;  POINT 13 SHOW 2
	DB 0A4H
	DB 0A4H
	DB 0A4H
	;  POINT 14 SHOW 2
	DB 0A4H
	DB 0A4H
	DB 0A4H



	;  POINT 15 SHOW 2
	DB 0F8H
	DB 0F8H
	DB 0F8H
	;  POINT 16 SHOW 2
	DB 0F8H
	DB 0F8H
	DB 0F8H


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


G32A6 ENDS
    END START

