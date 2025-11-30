;main 

SECTION .text

org 100h

mov ah,9h
mov dx,teksti
int 21h


mov ax,355;X1 = 355 
mov bx, 436;X2 = 436
add ax,bx; X1 + X2
mov cx, 13; X3 = 13
imul ax,cx;(X1 + X2)*X3
mov dx,4318;X4 = 4318
sub ax,dx
mov bx,20; X5 = 20
cwd 
div bx 
mov cx, ax


mov bl, 100
 
div bl        
start:
;начало вывода 
mov bx,0A30h 
xor ah,ah 
div bh 
add bl,ah 
xor ah,ah 
div bh 
mov dx,3030h 
add dx,ax 
mov ah,2 
int 21h 
mov dl,dh 
int 21h 
mov dl,bl 
int 21h 
;обработка остатка от деления, хранящегося 

mov ax, cx
mov bl, 100   
div bl
mov al,ah

mov bx,0A30h 
xor ah,ah 
div bh 
add bl,ah 
xor ah,ah 
div bh 
mov dx,3030h 
add dx,ax 
mov ah,2 
cmp ah,0
jne m1;ненужный
int 21h
m1:
jmp m3
m4:
mov dl,dh
cmp dl,0
jne m2 
int21h
m2:
mov dl,bl 
int 21h 
jmp end
;четвертый разряд числа
m3:
mov ax, cx  
mov bl, 100   
div bl

mov al,ah 

mov bx,0A30h 
xor ah,ah 
div bh 
add bl,ah 
xor ah,ah 
div bh 
mov dx,3030h 
add dx,ax 
mov ah,2 
;int 21h 
mov dl,dh 
int 21h 
mov dl,bl 
;int 21h 
jmp m4

;конец обработки
end:
;конец вывода 
xor ah,ah 
int 16h 
mov ah,4Ch 
int 21h 



SECTION .data
uusi_linja db "", 0xd, 0xa, '$'
teksti db "[(X1 + X2)*X3 - X4]/X5 = ", '$'

