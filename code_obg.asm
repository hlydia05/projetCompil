DATA SEGMENT 
m DW ?
n DW ?
w DW ?
v DD ?
s DW ?
T2 DD dup(?)
u DD ?
x DW ?
y DW ?
z DW ?
a DW ?
b DW ?
c DW ?
d DW ?
e DW ?
f DW ?
g DW ?
h DW ?
i DW ?
j DW ?
k DW ?
l DW ?
T1 DW 10 dup (?) 
temp DW 100 dup (?) 
DATA ENDS

CODE SEGEMENT
ASSUME CS:CODE, DS:DATA
MAIN :
MOV AX,DATA
MOV DS,AX

MOV AX, i
MUL AX, 3
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV a,AX 
MOV AX, 4
MUL AX, g
MOV SI,2
ADD SI,SI
MOV t[SI],AX 
MOV SI,2
ADD SI,SI
MOV AX,t[SI] 
MOV b,AX 
MOV AX, j
ADD AX, 1
MOV SI,3
ADD SI,SI
MOV t[SI],AX 
MOV SI,3
ADD SI,SI
MOV AX,t[SI] 
MOV f,AX 
MOV AX, c
SUB AX, 1
MOV SI,4
ADD SI,SI
MOV t[SI],AX 
MOV SI,4
ADD SI,SI
MOV AX, t[SI]
MUL AX, 4
MOV SI,5
ADD SI,SI
MOV t[SI],AX 
MOV SI,5
ADD SI,SI
MOV AX,t[SI] 
MOV k,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV h,AX 
MOV AX, j
SUB AX, 1
MOV SI,6
ADD SI,SI
MOV t[SI],AX 
MOV SI,6
ADD SI,SI
MOV AX,t[SI] 
MOV l,AX 
MOV AX, 4
MUL AX, y
MOV SI,7
ADD SI,SI
MOV t[SI],AX 
MOV SI,7
ADD SI,SI
MOV AX,t[SI] 
MOV z,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV y,AX 
MOV AX, j
ADD AX, 1
MOV SI,8
ADD SI,SI
MOV t[SI],AX 
MOV SI,8
ADD SI,SI
MOV AX, t[SI]
SUB AX, 1
MOV SI,9
ADD SI,SI
MOV t[SI],AX 
MOV AX, l
CMP AX,9 
JE etiquette 24
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 25
MOV t[1],0  
MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 29
MOV SI,9
ADD SI,SI
MOV AX, t[SI]
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
etiquette24:MOV AX, 
CMP AX, 
JMP etiquette 32
etiquette25:MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
MOV AX, u
MUL AX, 1.500000
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV u,AX 
MOV AX, i
CMP AX,n 
JG etiquette 38
etiquette29:MOV AX, 0
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, i
ADD AX, 1
MOV i,AX 
etiquette32:MOV AX, 
CMP AX, 
JMP etiquette 33
etiquette33:MOV AX, a
CMP AX,5 
JAE etiquette 41
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 42
MOV t[1],0  
MOV AX, m
CMP AX,2 
JB etiquette 45
etiquette38:MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 46
MOV t[1],0  
etiquette41:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
etiquette42:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 51
etiquette45:MOV t[1],0  
etiquette46:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 55
MOV AX, i
ADD AX, 1
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, 
CMP AX, 
JMP etiquette 51
FIN :
MOV AH,4CH
INT 21h
CODE ENDS
END MAIN
DATA SEGMENT 
m DW ?
n DW ?
w DW ?
v DD ?
s DW ?
T2 DD dup(?)
u DD ?
x DW ?
y DW ?
z DW ?
a DW ?
b DW ?
c DW ?
d DW ?
e DW ?
f DW ?
g DW ?
h DW ?
i DW ?
j DW ?
k DW ?
l DW ?
T1 DW 10 dup (?) 
temp DW 100 dup (?) 
DATA ENDS

CODE SEGEMENT
ASSUME CS:CODE, DS:DATA
MAIN :
MOV AX,DATA
MOV DS,AX

MOV AX, i
MUL AX, 3
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV a,AX 
MOV AX, 4
MUL AX, g
MOV SI,2
ADD SI,SI
MOV t[SI],AX 
MOV SI,2
ADD SI,SI
MOV AX,t[SI] 
MOV b,AX 
MOV AX, j
ADD AX, 1
MOV SI,3
ADD SI,SI
MOV t[SI],AX 
MOV SI,3
ADD SI,SI
MOV AX,t[SI] 
MOV f,AX 
MOV AX, c
SUB AX, 1
MOV SI,4
ADD SI,SI
MOV t[SI],AX 
MOV SI,4
ADD SI,SI
MOV AX, t[SI]
MUL AX, 4
MOV SI,5
ADD SI,SI
MOV t[SI],AX 
MOV SI,5
ADD SI,SI
MOV AX,t[SI] 
MOV k,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV h,AX 
MOV AX, j
SUB AX, 1
MOV SI,6
ADD SI,SI
MOV t[SI],AX 
MOV SI,6
ADD SI,SI
MOV AX,t[SI] 
MOV l,AX 
MOV AX, 4
MUL AX, y
MOV SI,7
ADD SI,SI
MOV t[SI],AX 
MOV SI,7
ADD SI,SI
MOV AX,t[SI] 
MOV z,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV y,AX 
MOV AX, j
ADD AX, 1
MOV SI,8
ADD SI,SI
MOV t[SI],AX 
MOV SI,8
ADD SI,SI
MOV AX, t[SI]
SUB AX, 1
MOV SI,9
ADD SI,SI
MOV t[SI],AX 
MOV AX, l
CMP AX,9 
JE etiquette 24
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 25
MOV t[1],0  
MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 29
MOV SI,9
ADD SI,SI
MOV AX, t[SI]
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
etiquette24:MOV AX, 
CMP AX, 
JMP etiquette 32
etiquette25:MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
MOV AX, u
MUL AX, 1.500000
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV u,AX 
MOV AX, i
CMP AX,n 
JG etiquette 38
etiquette29:MOV AX, 0
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, i
ADD AX, 1
MOV i,AX 
etiquette32:MOV AX, 
CMP AX, 
JMP etiquette 33
etiquette33:MOV AX, a
CMP AX,5 
JAE etiquette 41
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 42
MOV t[1],0  
MOV AX, m
CMP AX,2 
JB etiquette 45
etiquette38:MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 46
MOV t[1],0  
etiquette41:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
etiquette42:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 51
etiquette45:MOV t[1],0  
etiquette46:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 55
MOV AX, i
ADD AX, 1
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, 
CMP AX, 
JMP etiquette 51
FIN :
MOV AH,4CH
INT 21h
CODE ENDS
END MAIN
DATA SEGMENT 
m DW ?
n DW ?
w DW ?
v DD ?
s DW ?
T2 DD dup(?)
u DD ?
x DW ?
y DW ?
z DW ?
a DW ?
b DW ?
c DW ?
d DW ?
e DW ?
f DW ?
g DW ?
h DW ?
i DW ?
j DW ?
k DW ?
l DW ?
T1 DW 10 dup (?) 
temp DW 100 dup (?) 
DATA ENDS

CODE SEGEMENT
ASSUME CS:CODE, DS:DATA
MAIN :
MOV AX,DATA
MOV DS,AX

MOV AX, i
MUL AX, 3
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV a,AX 
MOV AX, 4
MUL AX, g
MOV SI,2
ADD SI,SI
MOV t[SI],AX 
MOV SI,2
ADD SI,SI
MOV AX,t[SI] 
MOV b,AX 
MOV AX, j
ADD AX, 1
MOV SI,3
ADD SI,SI
MOV t[SI],AX 
MOV SI,3
ADD SI,SI
MOV AX,t[SI] 
MOV f,AX 
MOV AX, c
SUB AX, 1
MOV SI,4
ADD SI,SI
MOV t[SI],AX 
MOV SI,4
ADD SI,SI
MOV AX, t[SI]
MUL AX, 4
MOV SI,5
ADD SI,SI
MOV t[SI],AX 
MOV SI,5
ADD SI,SI
MOV AX,t[SI] 
MOV k,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV h,AX 
MOV AX, j
SUB AX, 1
MOV SI,6
ADD SI,SI
MOV t[SI],AX 
MOV SI,6
ADD SI,SI
MOV AX,t[SI] 
MOV l,AX 
MOV AX, 4
MUL AX, y
MOV SI,7
ADD SI,SI
MOV t[SI],AX 
MOV SI,7
ADD SI,SI
MOV AX,t[SI] 
MOV z,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV y,AX 
MOV AX, j
ADD AX, 1
MOV SI,8
ADD SI,SI
MOV t[SI],AX 
MOV SI,8
ADD SI,SI
MOV AX, t[SI]
SUB AX, 1
MOV SI,9
ADD SI,SI
MOV t[SI],AX 
MOV AX, l
CMP AX,9 
JE etiquette 24
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 25
MOV t[1],0  
MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 29
MOV SI,9
ADD SI,SI
MOV AX, t[SI]
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
etiquette24:MOV AX, 
CMP AX, 
JMP etiquette 32
etiquette25:MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
MOV AX, u
MUL AX, 1.500000
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV u,AX 
MOV AX, i
CMP AX,n 
JG etiquette 38
etiquette29:MOV AX, 0
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, i
ADD AX, 1
MOV i,AX 
etiquette32:MOV AX, 
CMP AX, 
JMP etiquette 33
etiquette33:MOV AX, a
CMP AX,5 
JAE etiquette 41
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 42
MOV t[1],0  
MOV AX, m
CMP AX,2 
JB etiquette 45
etiquette38:MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 46
MOV t[1],0  
etiquette41:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
etiquette42:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 51
etiquette45:MOV t[1],0  
etiquette46:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 55
MOV AX, i
ADD AX, 1
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, 
CMP AX, 
JMP etiquette 51
FIN :
MOV AH,4CH
INT 21h
CODE ENDS
END MAIN
DATA SEGMENT 
m DW ?
n DW ?
w DW ?
v DD ?
s DW ?
T2 DD dup(?)
u DD ?
x DW ?
y DW ?
z DW ?
a DW ?
b DW ?
c DW ?
d DW ?
e DW ?
f DW ?
g DW ?
h DW ?
i DW ?
j DW ?
k DW ?
l DW ?
T1 DW 10 dup (?) 
temp DW 100 dup (?) 
DATA ENDS

CODE SEGEMENT
ASSUME CS:CODE, DS:DATA
MAIN :
MOV AX,DATA
MOV DS,AX

MOV AX, i
MUL AX, 3
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV a,AX 
MOV AX, 4
MUL AX, g
MOV SI,2
ADD SI,SI
MOV t[SI],AX 
MOV SI,2
ADD SI,SI
MOV AX,t[SI] 
MOV b,AX 
MOV AX, j
ADD AX, 1
MOV SI,3
ADD SI,SI
MOV t[SI],AX 
MOV SI,3
ADD SI,SI
MOV AX,t[SI] 
MOV f,AX 
MOV AX, c
SUB AX, 1
MOV SI,4
ADD SI,SI
MOV t[SI],AX 
MOV SI,4
ADD SI,SI
MOV AX, t[SI]
MUL AX, 4
MOV SI,5
ADD SI,SI
MOV t[SI],AX 
MOV SI,5
ADD SI,SI
MOV AX,t[SI] 
MOV k,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV h,AX 
MOV AX, j
SUB AX, 1
MOV SI,6
ADD SI,SI
MOV t[SI],AX 
MOV SI,6
ADD SI,SI
MOV AX,t[SI] 
MOV l,AX 
MOV AX, 4
MUL AX, y
MOV SI,7
ADD SI,SI
MOV t[SI],AX 
MOV SI,7
ADD SI,SI
MOV AX,t[SI] 
MOV z,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV y,AX 
MOV AX, j
ADD AX, 1
MOV SI,8
ADD SI,SI
MOV t[SI],AX 
MOV SI,8
ADD SI,SI
MOV AX, t[SI]
SUB AX, 1
MOV SI,9
ADD SI,SI
MOV t[SI],AX 
MOV AX, l
CMP AX,9 
JE etiquette 24
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 25
MOV t[1],0  
MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 29
MOV SI,9
ADD SI,SI
MOV AX, t[SI]
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
etiquette24:MOV AX, 
CMP AX, 
JMP etiquette 32
etiquette25:MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
MOV AX, u
MUL AX, 1.500000
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV u,AX 
MOV AX, i
CMP AX,n 
JG etiquette 38
etiquette29:MOV AX, 0
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, i
ADD AX, 1
MOV i,AX 
etiquette32:MOV AX, 
CMP AX, 
JMP etiquette 33
etiquette33:MOV AX, a
CMP AX,5 
JAE etiquette 41
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 42
MOV t[1],0  
MOV AX, m
CMP AX,2 
JB etiquette 45
etiquette38:MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 46
MOV t[1],0  
etiquette41:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
etiquette42:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 51
etiquette45:MOV t[1],0  
etiquette46:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 55
MOV AX, i
ADD AX, 1
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, 
CMP AX, 
JMP etiquette 51
FIN :
MOV AH,4CH
INT 21h
CODE ENDS
END MAIN
DATA SEGMENT 
m DW ?
n DW ?
w DW ?
v DD ?
s DW ?
T2 DD dup(?)
u DD ?
x DW ?
y DW ?
z DW ?
a DW ?
b DW ?
c DW ?
d DW ?
e DW ?
f DW ?
g DW ?
h DW ?
i DW ?
j DW ?
k DW ?
l DW ?
T1 DW 10 dup (?) 
temp DW 100 dup (?) 
DATA ENDS

CODE SEGEMENT
ASSUME CS:CODE, DS:DATA
MAIN :
MOV AX,DATA
MOV DS,AX

MOV AX, i
MUL AX, 3
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV a,AX 
MOV AX, 4
MUL AX, g
MOV SI,2
ADD SI,SI
MOV t[SI],AX 
MOV SI,2
ADD SI,SI
MOV AX,t[SI] 
MOV b,AX 
MOV AX, j
ADD AX, 1
MOV SI,3
ADD SI,SI
MOV t[SI],AX 
MOV SI,3
ADD SI,SI
MOV AX,t[SI] 
MOV f,AX 
MOV AX, c
SUB AX, 1
MOV SI,4
ADD SI,SI
MOV t[SI],AX 
MOV SI,4
ADD SI,SI
MOV AX, t[SI]
MUL AX, 4
MOV SI,5
ADD SI,SI
MOV t[SI],AX 
MOV SI,5
ADD SI,SI
MOV AX,t[SI] 
MOV k,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV h,AX 
MOV AX, j
SUB AX, 1
MOV SI,6
ADD SI,SI
MOV t[SI],AX 
MOV SI,6
ADD SI,SI
MOV AX,t[SI] 
MOV l,AX 
MOV AX, 4
MUL AX, y
MOV SI,7
ADD SI,SI
MOV t[SI],AX 
MOV SI,7
ADD SI,SI
MOV AX,t[SI] 
MOV z,AX 
MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV y,AX 
MOV AX, j
ADD AX, 1
MOV SI,8
ADD SI,SI
MOV t[SI],AX 
MOV SI,8
ADD SI,SI
MOV AX, t[SI]
SUB AX, 1
MOV SI,9
ADD SI,SI
MOV t[SI],AX 
MOV AX, l
CMP AX,9 
JE etiquette 24
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 25
MOV t[1],0  
MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 29
MOV SI,9
ADD SI,SI
MOV AX, t[SI]
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
etiquette24:MOV AX, 
CMP AX, 
JMP etiquette 32
etiquette25:MOV SI, 
ADD SI,SI
MOV AX,t[SI] 
MOV d,AX 
MOV AX, u
MUL AX, 1.500000
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV u,AX 
MOV AX, i
CMP AX,n 
JG etiquette 38
etiquette29:MOV AX, 0
ADD AX, 2
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, i
ADD AX, 1
MOV i,AX 
etiquette32:MOV AX, 
CMP AX, 
JMP etiquette 33
etiquette33:MOV AX, a
CMP AX,5 
JAE etiquette 41
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 42
MOV t[1],0  
MOV AX, m
CMP AX,2 
JB etiquette 45
etiquette38:MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 46
MOV t[1],0  
etiquette41:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
etiquette42:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 50
MOV t[1],1  
MOV AX, 
CMP AX, 
JMP etiquette 51
etiquette45:MOV t[1],0  
etiquette46:MOV SI,1
ADD SI,SI
MOV AX, t[SI]
CMP AX, 
JZ etiquette 55
MOV AX, i
ADD AX, 1
MOV SI,1
ADD SI,SI
MOV t[SI],AX 
MOV SI,1
ADD SI,SI
MOV AX,t[SI] 
MOV i,AX 
MOV AX, 
CMP AX, 
JMP etiquette 51
FIN :
MOV AH,4CH
INT 21h
CODE ENDS
END MAIN
