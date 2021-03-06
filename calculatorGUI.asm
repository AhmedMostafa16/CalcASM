.MODEL SMALL
.STACK 100H
RET2DOS MACRO
    MOV AH,4CH
    INT 21H
ENDM
SETMODE MACRO
    MOV AH,0
    MOV AL,13H
    INT 10H
ENDM
DRAW_HOR MACRO X,Y,Z,C   ;HORIZONTAL LINE from x to y in fixed z
    LOCAL L1
    MOV CX,X
    MOV DX,Z
    L1:
	MOV AH,0CH 
    MOV AL,C
    INT 10H
    INC CX
    CMP CX,Y
    JNZ L1    
ENDM  
CLEARREGISTER MACRO
	MOV CX,0
	MOV DX,0
	MOV AX,0
	MOV BX,0
ENDM
DRAW_VER MACRO X,Y,Z,C    ;VERTICAL LINE FROM X TO Y FIXED ROWZ   
    LOCAL L2
    MOV CX,Z
    MOV DX,X
    L2:MOV AH,0CH
    MOV AL,C      
    INT 10H
    INC DX
    CMP DX,Y
    JNZ L2
ENDM
DRAW_D MACRO X,Y,Z,C    ;VERTICAL LINE FROM X TO Y FIXED ROWZ   
    LOCAL L2
    MOV CX,Z
    MOV DX,X
    L2:MOV AH,0CH
    MOV AL,C      
    INT 10H
    INC DX
	INC CX
    CMP DX,Y
    JNZ L2
ENDM
DRAW_DD MACRO X,Y,Z,C    ;VERTICAL LINE FROM X TO Y FIXED ROWZ   
    LOCAL L2
    MOV CX,Z
    MOV DX,Y
    L2:MOV AH,0CH
    MOV AL,C      
    INT 10H
    DEC DX
	INC CX
    CMP DX,X
    JNZ L2
ENDM
DRAWMUL MACRO 
	DRAW_D 110+3,118+4,14+10,14
	DRAW_DD 110+2,118+3,14+10,14
ENDM
DRAWOUTER MACRO
    CLEARREGISTER
	DRAW_HOR 4,254,4,1
	CLEARREGISTER
	DRAW_HOR 4,255,194,1
	CLEARREGISTER
	DRAW_VER 4,194,4,1
	CLEARREGISTER
	DRAW_VER 4,194,254,1
	CLEARREGISTER
ENDM
DRAWTEXTVIEW MACRO
	CLEARREGISTER
	DRAW_HOR 9,249,9,7
	CLEARREGISTER
	DRAW_HOR 9,250,69,7
	CLEARREGISTER
	DRAW_VER 9,69,9,7
	CLEARREGISTER
	DRAW_VER 9,69,249,7
	CLEARREGISTER
ENDM
DRAWBUTTON MACRO X, Y, C
	CLEARREGISTER
	DRAW_HOR Y,(Y+39),X,C
	CLEARREGISTER
	DRAW_HOR Y,(Y+39),(X+24),C
	CLEARREGISTER
	DRAW_VER X,(X+24),Y,C
	CLEARREGISTER
	DRAW_VER X,(X+25),(Y+39),C
	CLEARREGISTER
ENDM
DRAWZEROBUTTON MACRO X, Y, C
	CLEARREGISTER
	DRAW_HOR Y,(Y+39+40+10),X,C
	CLEARREGISTER
	DRAW_HOR Y,(Y+39+40+10),(X+24),C
	CLEARREGISTER
	DRAW_VER X,(X+24),Y,C
	CLEARREGISTER
	DRAW_VER X,(X+25),(Y+39+40+10),C
	CLEARREGISTER
ENDM
DRAWEQBUTTON MACRO X, Y, C
	CLEARREGISTER
	DRAW_HOR Y,(Y+39),X,C
	CLEARREGISTER
	DRAW_HOR Y,(Y+39),(X+24+25+5),C
	CLEARREGISTER
	DRAW_VER X,(X+24+25+5),Y,C
	CLEARREGISTER
	DRAW_VER X,(X+25+25+5),(Y+39),C
	CLEARREGISTER
ENDM
SETBUTTON MACRO
	DRAWBUTTON 74,9,14
	DRAWBUTTON 104,9,14
	DRAWBUTTON 134,9,14
	DRAWBUTTON 164,9,14
	DRAWBUTTON 74,59,15
	DRAWBUTTON 104,59,15
	DRAWBUTTON 134,59,15
	DRAWZEROBUTTON 164,59,15
	DRAWBUTTON 74,109,15
	DRAWBUTTON 104,109,15
	DRAWBUTTON 134,109,15
	DRAWBUTTON 74,159,15
	DRAWBUTTON 104,159,15
	DRAWBUTTON 134,159,15
	DRAWBUTTON 164,159,12
	DRAWBUTTON 74,209,12
	DRAWBUTTON 104,209,12
	DRAWEQBUTTON 134,209,10	
ENDM
DRAWDIV MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,14
	DRAW_HOR (Y-1),(Y+1),X-3,14
	DRAW_HOR (Y-1),(Y+1),X-4,14
	DRAW_HOR (Y-1),(Y+1),X+3,14
	DRAW_HOR (Y-1),(Y+1),X+4,14
ENDM
DRAWPLUS MACRO X,Y
	DRAW_HOR (Y-4),(Y+4+1),X,14
	DRAW_VER (X-4),(X+4+1),(Y),14
ENDM
DRAWMINUS MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,14
ENDM
DRAW8 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,15
	DRAW_HOR (Y-4),(Y+4),X-8,15
	DRAW_HOR (Y-4),(Y+5),X+8,15
	DRAW_VER (X-8),(X+8),(Y-4),15
	DRAW_VER (X-8),(X+8),(Y+4),15
ENDM
DRAW6 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,15
	DRAW_HOR (Y-4),(Y+4),X-8,15
	DRAW_HOR (Y-4),(Y+5),X+8,15
	DRAW_VER (X-8),(X+8),(Y-4),15
	DRAW_VER X,(X+8),(Y+4),15
ENDM
DRAW5 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,15
	DRAW_HOR (Y-4),(Y+4),X-8,15
	DRAW_HOR (Y-4),(Y+5),X+8,15
	DRAW_VER (X-8),(X),(Y-4),15
	DRAW_VER (X),(X+8),(Y+4),15
ENDM
DRAW4 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,15
	DRAW_VER (X-8),(X),(Y-4),15
	DRAW_VER (X-8),(X+8),(Y+4),15
ENDM
DRAW3 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,15
	DRAW_HOR (Y-4),(Y+4),X-8,15
	DRAW_HOR (Y-4),(Y+4),X+8,15
	DRAW_VER (X-8),(X+9),(Y+4),15
ENDM
DRAW2 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,15
	DRAW_HOR (Y-4),(Y+5),X-8,15
	DRAW_HOR (Y-4),(Y+4),X+8,15
	DRAW_VER (X),(X+9),(Y-4),15
	DRAW_VER (X-8),(X+1),(Y+4),15
ENDM
DRAW1 MACRO X,Y
	DRAW_VER (X-8),(X+8),(Y+4),15
ENDM
DRAW0 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X-8,15
	DRAW_HOR (Y-4),(Y+4),X+8,15
	DRAW_VER (X-8),(X+8),(Y-4),15
	DRAW_VER (X-8),(X+9),(Y+4),15
ENDM
DRAWC MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X-8,12
	DRAW_HOR (Y-4),(Y+4),X+8,12
	DRAW_VER (X-8),(X+8),(Y-4),12
ENDM
DRAWAC MACRO X,Y
	DRAW_HOR (Y-4+6),(Y+4+6),X-8,12
	DRAW_HOR (Y-4+6),(Y+4+6),X+8,12
	DRAW_VER (X-8),(X+8),(Y-4+6),12
	
	DRAW_HOR (Y-4-6),(Y+4-6),X,12
	DRAW_HOR (Y-4-6),(Y+4-6),X-8,12
	DRAW_VER (X-8),(X+8+1),(Y-4-6),12
	DRAW_VER (X-8),(X+8+1),(Y+4-6),12
ENDM
DRAW7 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X-8,15
	DRAW_VER (X-8),(X+8),(Y+4),15
ENDM
DRAW9 MACRO X,Y
	DRAW_HOR (Y-4),(Y+4),X,15
	DRAW_HOR (Y-4),(Y+4),X-8,15
	DRAW_HOR (Y-4),(Y+4),X+8,15
	DRAW_VER (X-8),(X),(Y-4),15
	DRAW_VER (X-8),(X+9),(Y+4),15
ENDM
DRAWEQ MACRO X,Y
	DRAW_HOR (Y-5),(Y+5),X-2,10
	DRAW_HOR (Y-5),(Y+5),X+1,10
ENDM
WRITELEBEL MACRO
	DRAW9 (74+12),(159+20)
	DRAW8 (74+12),(109+20)
	DRAW7 (74+12),(59+20)
	DRAW6 (104+12),(159+20)
	DRAW5 (104+12),(109+20)
	DRAW4 (104+12),(59+20)
	DRAW3 (134+12),(159+20)
	DRAW2 (134+12),(109+20)
	DRAW1 (134+12),(59+20)
	DRAW0 (164+12),(59+40)
	WRITECHAR 'O',22,21,12
	WRITECHAR 'F',22,22,12
	WRITECHAR 'F',22,23,12
	DRAWPLUS(164+12),(9+20)
	DRAWMINUS(134+12),(9+20)
	DRAWMUL(104+12),(9+20)
	DRAWDIV(74+12),(9+20)
	DRAWC(74+12),(209+20)
	DRAWAC(104+12),(209+20)
	DRAWEQ(134+26),(209+20)
	DRAWMUL
ENDM
WRITECHAR MACRO CHAR,R,C,COL
	MOV AH,0BH
	MOV BH,0H
	MOV BL,3
	INT 10H
	MOV AH,2
	MOV BH,0
	MOV DH,R
	MOV DL,C
	INT 10H
	MOV AH,9
	MOV AL,CHAR
	MOV BL,COL
	MOV CX,1
	INT 10H
ENDM
INITTEXTVIEW MACRO
	WRITECHAR 'I',2,2,11
	WRITECHAR 'N',2,3,11
	WRITECHAR 'P',2,4,11
	WRITECHAR 'U',2,5,11
	WRITECHAR 'T',2,6,11
	WRITECHAR ':',2,7,11
	WRITECHAR 'A',4+1,2,11
	WRITECHAR 'N',4+1,3,11
	WRITECHAR 'S',4+1,4,11
	WRITECHAR ':',4+1,5,11
ENDM
INITMOUSE MACRO
	MOV AX,0
	INT 33H ; INITIALIZE MOUSE
	MOV AX,1
	INT 33H ; MOUSE POINTER SHOW
ENDM
COMPARE MACRO V,H ; PASS COMPARE-VALUE TO CX, 2=OK
	LOCAL CC1,CC2,CC3,INCRE1,INCRE2,END_CMP
	MOV AX,MOUSE_POS_H
	MOV BX,MOUSE_POS_V
	MOV CX,0
	CMP AX,H
	JGE CC1
	JMP END_CMP
	CC1:
	SUB AX,H
	CMP AX,40
	JLE INCRE1
	JMP END_CMP
	INCRE1:
	INC CX
	CMP BX,V
	JGE CC2
	JMP END_CMP
	CC2:
	SUB BX,V
	CMP BX,25
	JLE INCRE2
	JMP END_CMP
	INCRE2:
	INC CX
	JMP END_CMP
	END_CMP:
ENDM		
GETCHAR MACRO ; PASS THE CHAR TO CX
	LOCAL END_GETCHAR,P_EQ,P_AC,P_C,P_DOT,P_0,P_1,P_2,P_3,P_4,P_5,P_6,P_7,P_8,P_9,P_PLUS,P_MIN,P_MUL,P_DIV
	LOCAL A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q
	COMPARE 134,209
	CMP CX,2
	JE P_EQ
	CMP CX,2
	JNE A	
	P_EQ:
	MOV CL, '='
	MOV CURRENT_CHAR,CL
	A:
	COMPARE 104,209
	CMP CX,2
	JE P_AC
	CMP CX,2
	JNE B
	P_AC:
	MOV CL, 'A'
	MOV CURRENT_CHAR,CL	
	B:
	COMPARE 74,209
	CMP CX,2
	JE P_C
	CMP CX,2
	JNE C
	P_C:
	MOV CL, 'C'
	MOV CURRENT_CHAR,CL
	C:
	COMPARE 164,159
	CMP CX,2
	JE P_DOT
	CMP CX,2
	JNE D
	P_DOT:
	MOV CL, '.'
	MOV CURRENT_CHAR,CL
	D:
	COMPARE 134,159
	CMP CX,2
	JE P_3
	CMP CX,2
	JNE E
	P_3:
	MOV CL, '3'
	MOV CURRENT_CHAR,CL
	E:
	COMPARE 104,159
	CMP CX,2
	JE P_6
	CMP CX,2
	JNE F
	P_6:
	MOV CL, '6'
	MOV CURRENT_CHAR,CL
	F:
	COMPARE 74,159
	CMP CX,2
	JE P_9
	CMP CX,2
	JNE G
	P_9:
	MOV CL, '9'
	MOV CURRENT_CHAR,CL	
	G:
	COMPARE 134,109
	CMP CX,2
	JE P_2
	CMP CX,2
	JNE H
	P_2:
	MOV CL, '2'
	MOV CURRENT_CHAR,CL	
	H:
	COMPARE 104,109
	CMP CX,2
	JE P_5
	CMP CX,2
	JNE I
	P_5:
	MOV CL, '5'
	MOV CURRENT_CHAR,CL
	I:
	COMPARE 74,109
	CMP CX,2
	JE P_8
	CMP CX,2
	JNE J
	P_8:
	MOV CL, '8'
	MOV CURRENT_CHAR,CL
	J:
	COMPARE 164,59
	CMP CX,2
	JE P_0
	CMP CX,2
	JNE K
	P_0:
	MOV CL, '0'
	MOV CURRENT_CHAR,CL
	K:
	COMPARE 134,59
	CMP CX,2
	JE P_1
	CMP CX,2
	JNE L
	P_1:
	MOV CL, '1'
	MOV CURRENT_CHAR,CL
	L:
	COMPARE 104,59
	CMP CX,2
	JE P_4
	CMP CX,2
	JNE M
	P_4:
	MOV CL, '4'
	MOV CURRENT_CHAR,CL
	M:
	COMPARE 74,59
	CMP CX,2
	JE P_7
	CMP CX,2
	JNE N
	P_7:
	MOV CL, '7'
	MOV CURRENT_CHAR,CL	
	N:
	COMPARE 164,9
	CMP CX,2
	JE P_PLUS
	CMP CX,2
	JNE O
	P_PLUS:
	MOV CL, '+'
	MOV CURRENT_CHAR,CL
	O:
	COMPARE 134,9
	CMP CX,2
	JE P_MIN
	CMP CX,2
	JNE P
	P_MIN:
	MOV CL, '-'
	MOV CURRENT_CHAR,CL
	P:
	COMPARE 104,9
	CMP CX,2
	JE P_MUL
	CMP CX,2
	JNE Q
	P_MUL:
	MOV CL, 'X'
	MOV CURRENT_CHAR,CL
	Q:
	COMPARE 74,9
	CMP CX,2
	JE P_DIV
	CMP CX,2
	JNE END_GETCHAR
	P_DIV:
	MOV CL, '/'
	MOV CURRENT_CHAR,CL
	JMP END_GETCHAR
	END_GETCHAR:
ENDM
;......graphics over............
ONCLICK MACRO
	LOCAL NEXT1,NEXT2,NEXT3,P1,P2,M1,M2,S1,S2,D1,D2,NEXT4,NEXT5,NEXT6,NEXT7,NEXT8,NEXT9,NEXT10,NEXT11,NEXT12,NEXT13,NEXT14,N1,N2,FINAL,NOTNOT,SSS
	GETCHAR
	;.....BACKSPACE......
	MOV CL,'C'
	CMP CURRENT_CHAR,CL
	JNE NEXT1
	MOV DL,0
	CMP LI,DL
	JE NEXT1
	DEC LI
	DEC PIXEL_POINTER
	WRITECHAR ' ',3,PIXEL_POINTER,0
	;.....AC..........
	NEXT1:
	MOV CL,'A'
	CMP CURRENT_CHAR,CL
	JNE NEXT2
	INIT_VARIABLE
	CLEAR_SCREEN
	;.....EXIT....
	NEXT2:
	MOV CL,'.'
	CMP CURRENT_CHAR,CL
	JNE NEXT3
	RET2DOS
	;....PLUS.........
	NEXT3:
	MOV CL,'+'
	CMP CURRENT_CHAR,CL
	JNE NEXT4
	MOV OPERATOR,CL
	WRITECHAR '+',6,30,14
	MOV DL,1
	CMP FLAG,DL
	JE P1
	CMP FLAG,DL
	JNE P2
	P1:
	MOV BL,2
	MOV FLAG,BL
	MOV PIXEL_POINTER,BL
	CALL CLEAR
	P2:
	;.........SUB.......
	NEXT4:
	MOV CL,'-'
	CMP CURRENT_CHAR,CL
	JNE NEXT5
	MOV OPERATOR,CL
	WRITECHAR '-',6,30,14
	MOV DL,1
	CMP FLAG,DL
	JE S1
	CMP FLAG,DL
	JNE S2
	S1:
	MOV BL,2
	MOV FLAG,BL
	MOV PIXEL_POINTER,BL
	CALL CLEAR
	S2:
	;........MUL............
	NEXT5:
	MOV CL,'X'
	CMP CURRENT_CHAR,CL
	JNE NEXT6
	MOV OPERATOR,CL
	WRITECHAR 'X',6,30,14
	MOV DL,1
	CMP FLAG,DL
	JE M1
	CMP FLAG,DL
	JNE M2
	M1:
	MOV BL,2
	MOV FLAG,BL
	MOV PIXEL_POINTER,BL
	CALL CLEAR
	M2:
	;........DIV............
	NEXT6:
	MOV CL,'/'
	CMP CURRENT_CHAR,CL
	JNE NEXT7
	MOV OPERATOR,CL
	WRITECHAR '/',6,30,14
	MOV DL,1
	CMP FLAG,DL
	JE D1
	CMP FLAG,DL
	JNE D2
	D1:
	MOV BL,2
	MOV FLAG,BL
	MOV PIXEL_POINTER,BL
	CALL CLEAR
	D2:
	
	NEXT7:
	MOV CL,CURRENT_CHAR
	CMP CL,48
	JL NOTNOT
	CMP CL,'9'
	JG NOTNOT
	MOV CL,1
	CMP FLAG,CL
	JE N1
	MOV CL,2
	CMP FLAG,CL
	JE N2
	NOTNOT:
	JMP FINAL
	N1:
	APPEND1
	JMP FINAL
	N2:
	APPEND2
	JMP FINAL
	
	FINAL:
	MOV CL,'='
	CMP CURRENT_CHAR,CL
	JNE SSS
	CALL SOLVE
	SSS:
ENDM
APPEND1 MACRO
	MOV CX,0
	MOV CL,LI
	MOV SI,CX
	MOV CL,CURRENT_CHAR
	MOV ARA_I[SI],CL
	INC LI
	WRITECHAR CURRENT_CHAR,3,PIXEL_POINTER,15
	INC PIXEL_POINTER
ENDM
APPEND2 MACRO
	MOV CX,0
	MOV CL,LO
	MOV SI,CX
	MOV CL,CURRENT_CHAR
	MOV ARA_O[SI],CL
	INC LO
	WRITECHAR CURRENT_CHAR,3,PIXEL_POINTER,15
	INC PIXEL_POINTER
ENDM
CLEAR_SCREEN MACRO
	LOCAL LL
	MOV CL,2
	MOV I,CL
	LL:
	WRITECHAR ' ',3,I,0
	WRITECHAR ' ',6,I,0
	INC I
	MOV CL,I
	CMP CL,30
	JL LL
ENDM
WORD_TO_DISPLAY MACRO WD,XXX
	LOCAL A,B
	MOV CL,0
	MOV I,CL
	MOV AX,WD
	MOV BL,10
	A:
	DIV BL
	MOV DL,AH
	MOV DH,0
	ADD DL,48
	MOV AH,0
	PUSH DX
	INC I
	CMP AL,0
	JG A
	MOV CL,XXX
	MOV K,CL
	B:
	POP DX
	MOV J,DL
	WRITECHAR J,6,K,15
	INC K
	DEC I
	MOV CL,I
	CMP CL,0
	JNE B	
ENDM
INIT_VARIABLE MACRO
	MOV CX,0
	MOV LI,CL
	MOV LO,CL
	MOV INPUT_VALUE,CX
	MOV OUTPUT_VALUE,CX
	MOV CL,1
	MOV FLAG,CL
	MOV CL,2
	MOV PIXEL_POINTER,CL
	CLEARREGISTER
ENDM
SAVE_INPUT_VAL MACRO
	LOCAL T,W	
	MOV AX,0
	MOV BL,10
	MOV CH,0
	MOV CL,LI
	MOV SI,0
	T:
	MUL BL
	MOV DL,ARA_I[SI]
	INC SI
	MOV DH,0
	ADD AX,DX
	SUB AX,48
	LOOP T
	MOV INPUT_VALUE,AX
ENDM
SAVE_OUTPUT_VAL MACRO
	LOCAL T,W	
	MOV AX,0
	MOV BL,10
	MOV CH,0
	MOV CL,LO
	MOV SI,0
	T:
	MUL BL
	MOV DL,ARA_O[SI]
	INC SI
	MOV DH,0
	ADD AX,DX
	SUB AX,48
	LOOP T
	MOV OUTPUT_VALUE,AX
ENDM
.DATA
I DB ?
J DB ?
K DB ?
L DB ?
ARA_I DB 40 DUP (?)
ARA_O DB 40 DUP (?)
LI DB ?
LO DB ?
FLAG DB ?
OPERATOR DB ?
CURRENT_CHAR DB ?
PIXEL_POINTER DB ?
INPUT_VALUE DW ?
OUTPUT_VALUE DW ?
MOUSE_POS_H DW ?
MOUSE_POS_V DW ?
.CODE
MAIN PROC  
    ;.....INIT.......
    SETMODE
	DRAWOUTER
	DRAWTEXTVIEW
	SETBUTTON
	WRITELEBEL
	INITTEXTVIEW
	INITMOUSE
	INIT_VARIABLE
	CLEARREGISTER
	;....MOUSE......
	
	INIT_POS:
	MOV AX,0
	MOV MOUSE_POS_H,AX
	MOV MOUSE_POS_V,AX
	
	
	WAIT_FOR_PRESS:
	MOV AX,5
	MOV BX,0
	INT 33H
	CMP AX,1
	JE NEXT
	CMP AX,1
	JNE WAIT_FOR_PRESS
	NEXT:
	SHR CX,1
	CMP CX,MOUSE_POS_H
	JE WAIT_FOR_PRESS
	CMP CX,MOUSE_POS_H
	JNE CLICKED
	CLICKED:
	MOV MOUSE_POS_H,CX
	MOV MOUSE_POS_V,DX
	ONCLICK
	JMP WAIT_FOR_PRESS
	;.......ESCAPE TO EXIT........
	
    ENDALL:
	RET2DOS
	MAIN ENDP
	CLEAR PROC
	CLEAR_SCREEN
	RET
	CLEAR ENDP
	;...............
	
	SOLVE PROC
	;
	MOV CL,2
	MOV L,CL
	SAVE_INPUT_VAL
	SAVE_OUTPUT_VAL
	;...................
	MOV CL,OPERATOR
	
	CMP CL,'+'
	JNE NEXT1
	MOV DX,0
	ADD DX,INPUT_VALUE
	ADD DX,OUTPUT_VALUE
	MOV OUTPUT_VALUE,DX
	
	
	NEXT1:
	
	CMP CL,'-'
	JNE NEXT2
	
	MOV DX,INPUT_VALUE
	CMP DX,OUTPUT_VALUE
	JGE POS
	CMP DX,OUTPUT_VALUE
	JL NEGT
	
	POS:
	SUB DX,OUTPUT_VALUE
	MOV OUTPUT_VALUE,DX
	JMP NEXT2
	
	NEGT:
	MOV DX,OUTPUT_VALUE
	SUB DX,INPUT_VALUE
	MOV OUTPUT_VALUE,DX
	INC L
	WRITECHAR '-',6,2,15
	
	NEXT2:
	
	CMP CL,'X'
	JNE NEXT3
	
	MOV AX,INPUT_VALUE
	MOV BX,OUTPUT_VALUE
	MUL BX
	MOV OUTPUT_VALUE,AX
	
	NEXT3:
	
	CMP CL,'/'
	JNE NEXT4
	
	MOV AX,INPUT_VALUE
	MOV BX,OUTPUT_VALUE
	CMP BL,0
	JE NEXT55
	DIV BL
	MOV AH,0
	MOV OUTPUT_VALUE,AX
	JMP NEXT4
	NEXT55:
	JMP NEXT5
	NEXT4:
	WRITECHAR '=',6,30,14
	WORD_TO_DISPLAY OUTPUT_VALUE,L
	JMP NEXT6
	NEXT5:
	WRITECHAR 'I',6,2,12
	WRITECHAR 'N',6,2,12
	WRITECHAR 'F',6,2,12
	NEXT6:
	RET
	SOLVE ENDP
END MAIN
