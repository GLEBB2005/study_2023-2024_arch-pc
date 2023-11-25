%include 'in_out.asm'
section .data
msg1 DB 'Введите x: ',0h
msg2 DB "Введите a: ",0h
otv: DB 'F(x)=',0h
section .bss
x: RESB 80
a: RESB 80
res: RESB 80
section .text
global _start
_start:
mov eax,msg1
call sprint
mov ecx,x
mov edx,80
call sread
mov eax,x
call atoi
mov [x],eax
mov eax,msg2
call sprint
mov ecx,a
mov edx,80
call sread
mov eax,a
call atoi
mov [a],eax
mov eax, [x]
cmp eax, [a]
je x_is_3
mov eax, [x]
imul eax,5
jmp calc_res
x_is_3:
mov eax, [x]
add eax,[a]
calc_res:
mov [res],eax
fin:
mov eax,otv
call sprint
mov eax,[res]
call iprintLF
call quit
