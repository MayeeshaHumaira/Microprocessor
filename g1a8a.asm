G1A8 SEGMENT PARA PUBLIC 'CODE'

ASSUME CS: G1A8
ORG 1000H


START:

 MOV AL, 80H
 OUT 1FH, AL
 
 MOV AL, 80H
 OUT 1EH, AL
 
 MOV AL, 0FFH
 OUT 19H, AL
 
 MOV AL, 00H
 OUT 1BH, AL
 
 MOV BH, 80H
 MOV BL, 01H
 MOV DX, 05H  
 
 OUTER:
 
 MOV CX, 0FFH
  
 L1:
    PUSH CX
    
    CMP BL, 01H
    JG  A
    
    MOV SI, OFFSET DATA_Z
    MOV DI, OFFSET DATA_LED_SSD
    JMP FORWARD
    
    A:
    CMP BL, 02H
    JG M
    MOV SI, OFFSET DATA_A
    MOV DI, OFFSET DATA_LED_SSD
    INC DI
    JMP FORWARD
    
    M:
    CMP BL, 03H
    JG START
    MOV SI, OFFSET DATA_M
    MOV DI, OFFSET DATA_LED_SSD
    ADD DI, 02H
    JMP FORWARD
    
    FORWARD:
    MOV AH, BH
        
    MOV CX, 05H
    SUB CX, DX
    ADD SI, CX
    ADD SI, CX
    
    MOV CX, DX
    
    L2: 
        PUSH CX 
        MOV AL, BYTE PTR CS:[SI]
        OUT 18H, AL
        MOV AL, BYTE PTR CS:[SI+1]
        OUT 1AH, AL
    
        MOV AL, AH 
        OUT 1CH, AL
        
        MOV AL, BYTE PTR CS:[DI]
        OUT 1BH, AL
        
        MOV AL, BYTE PTR CS:[DI+3]
        OUT 19H, AL
    
        MOV CX, 0FFH 
        L0: LOOP L0
        
        SHL AH, 1
        JNZ NEXT
        
        POP CX
        JMP BREAK 
        
        NEXT:
        ADD SI, 02H
        POP CX
                             
    LOOP L2
    
    BREAK:    
    POP CX
     
 LOOP L1 
 
 SHR BH, 1
 JNZ CONTINUE
 
 DEC DX
 JZ RESET
 
 MOV BH,01H 
 JMP CONTINUE
 
 RESET:
 MOV BH, 80H  
 MOV DX, 05H
 
 INC BL
 CMP BL, 04H
 JLE CONTINUE
 MOV BL, 01H  
 
 CONTINUE:
 
 JMP OUTER
 
 DATA_Z:
    DB 0FFH
    DB 077H
    
    DB 0FFH
    DB 067H
    
    DB 0FFH
    DB 057H
    
    DB 0FFH
    DB 037H
    
    DB 0FFH
    DB 77H
    
 DATA_A:
    DB 083H
    DB 0FFH

    DB 06FH
    DB 0FFH 
    
    DB 06FH
    DB 0FFH

    DB 06FH
    DB 0FFH

    DB 083H
    DB 0FFH


 
 DATA_M:

   DB 003H
   DB 003H

   DB 0BFH
   DB 0BFH

   DB 0DFH
   DB 0DFH

   DB 0BFH
   DB 0BFH  

   DB 003H
   DB 003H 
   
 
 DATA_LED_SSD:
   DB 01H 
   DB 02H 
   DB 0CH
 
   DB 0F9H 
   DB 0A4H 
   DB 0B0H 
 
G1A8 ENDS

END START
 

