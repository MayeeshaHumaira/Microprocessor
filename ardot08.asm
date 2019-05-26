;R6(Red)-C1(Green)-R0(Orange)-C3(Red)
D SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:D
ORG 1000H

START:
    MOV AL, 080H
    OUT 1EH,AL
    
    MOV BX,018H
    
    MOV SI,OFFSET DATA      
L1: MOV AL,BYTE PTR CS:[SI] 
    ;PORT A
    OUT 18H,AL
    INC SI
    MOV AL,BYTE PTR CS:[SI] 
    ;PORT B
    OUT 1AH,AL
    INC SI
    MOV AL,BYTE PTR CS:[SI] 
    ;PORT C
    OUT 1CH,AL

 
    MOV CX,0FFFFH
    L2:LOOP L2
 

    INC SI
    DEC BX
    CMP BL,00H
    JE END
    JMP L1
    
    DATA:
    ;C0(Red)
    DB 01H    
    DB 0FEH    
    DB 01H  
    DB 03H
    DB 0FCH     
    DB 01H  
    DB 07H   
    DB 0F8H 
    DB 01H
    DB 0FH    
    DB 0F0H    
    DB 01H
    DB 01FH     
    DB 0E0H     
    DB 01H
    DB 03FH   
    DB 0C0H 
    DB 01H
    DB 07FH    
    DB 080H    
    DB 01H
    DB 0FFH     
    DB 00H     
    DB 01H
    
    ;R2(Orange)
    DB 0FBH
    DB 0FBH
    DB 01H
    DB 0FBH
    DB 0FBH
    DB 03H
    DB 0FBH
    DB 0FBH
    DB 07H
    DB 0FBH
    DB 0FBH
    DB 0FH
    DB 0FBH
    DB 0FBH
    DB 01FH
    DB 0FBH
    DB 0FBH
    DB 03FH
    DB 0FBH
    DB 0FBH
    DB 07FH
    DB 0FBH
    DB 0FBH
    DB 0FFH  
    
    ;C4(Green)
    DB 0FEH
    DB 01H
    DB 01H
    DB 0FCH
    DB 03H
    DB 01H
    DB 0F8H
    DB 07H
    DB 01H
    DB 0F0H
    DB 0FH
    DB 01H
    DB 0E0H
    DB 01FH
    DB 01H
    DB 0C0H
    DB 03FH
    DB 01H
    DB 080H
    DB 07FH
    DB 01H
    DB 00H
    DB 0FFH
    DB 01H
    
    
    
END:
D ENDS
END START