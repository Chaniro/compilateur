;entete
extrn lirent:proc, ecrent:proc 
extrn ecrbool:proc 
extrn ecrch:proc,ligsuiv:proc

.model SMALL
.586

.CODE
max : 
;ouvBloc 6
enter 6,0
;iload 6
push word ptr [bp+6]

;istore -6
pop ax 
mov word ptr [bp-6],ax

;iload -6
push word ptr [bp-6]

;iload 4
push word ptr [bp+4]

;isup 
pop bx 
pop ax 
cmp ax,bx 
jle $+6 
push -1 
jmp $+4 
push 0 

;iffaux SINON1
pop ax
cmp ax,0
je SINON1

;iload -6
push word ptr [bp-6]

;ireturn 4
pop ax
 mov [bp+4],ax
;goto FSI1
jmp FSI1

SINON1:
;iload 4
push word ptr [bp+4]

;ireturn 4
pop ax
 mov [bp+4],ax
FSI1:
;fermebloc 4
leave
ret 4


min : 
;ouvBloc 0
enter 0,0
;iload 6
push word ptr [bp+6]

;iload 4
push word ptr [bp+4]

;iinf 
pop bx 
pop ax 
cmp ax,bx 
jge $+6 
push -1 
jmp $+4 
push 0 

;iffaux SINON2
pop ax
cmp ax,0
je SINON2

;iload 6
push word ptr [bp+6]

;ireturn 4
pop ax
 mov [bp+4],ax
;goto FSI2
jmp FSI2

SINON2:
FSI2:
;fermebloc 4
leave
ret 4


sup : 
;ouvBloc 0
enter 0,0
;iload 6
push word ptr [bp+6]

;iload 4
push word ptr [bp+4]

;isup 
pop bx 
pop ax 
cmp ax,bx 
jle $+6 
push -1 
jmp $+4 
push 0 

;ireturn 4
pop ax
 mov [bp+4],ax
;fermebloc 4
leave
ret 4


debut:
	STARTUPCODE

main :
;ouvBloc 8
enter 8,0
;iconst 5
push word ptr 5

;istore -2
pop ax 
mov word ptr [bp-2],ax

;lireEnt -4
lea dx,[bp-4]
push dx
call lirent

;aLaLigne
call ligsuiv

;iload -2
push word ptr [bp-2]

;iload -4
push word ptr [bp-4]

;iconst 5
push word ptr 5

;call min
call min
;call min
call min
;iconst 2
push word ptr 2

;iadd 
pop bx 
pop ax 
add ax, bx 
push ax

;istore -6
pop ax 
mov word ptr [bp-6],ax

;iconst 1
push word ptr 1

;iload -2
push word ptr [bp-2]

;iload -4
push word ptr [bp-4]

;iconst 5
push word ptr 5

;isub 
pop bx 
pop ax 
sub ax, bx 
push ax

;call max
call max
;iadd 
pop bx 
pop ax 
add ax, bx 
push ax

;iload -2
push word ptr [bp-2]

;iconst 2
push word ptr 2

;imul 
pop bx 
pop ax 
imul bx
push ax

;iload -4
push word ptr [bp-4]

;call min
call min
;call min
call min
;istore -8
pop ax 
mov word ptr [bp-8],ax

;aLaLigne
call ligsuiv

;iload -6
push word ptr [bp-6]

;ecrireEnt
call ecrent

;aLaLigne
call ligsuiv

;iload -8
push word ptr [bp-8]

;ecrireEnt
call ecrent

;queue
nop 
exitcode
end debut
