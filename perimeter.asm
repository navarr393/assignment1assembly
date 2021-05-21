;===== Begin code area ================================================================================================
extern printf
extern scanf
global perimeter

segment .data
welcome1 db "Welcome to an friendly assembly program by David N.", 10
heightinput db "Enter the height:",10,0
widthinput db "Enter the width: ",0
perimeter db "The perimeter is: ",0
length db "The length of the average side is: ",0
good_bye db "I hope you enjoyed your rectangle The assembly program will send the perimeter to the main function.",10,0
height db "%lf",0
width db "%lf",0
perimeter db "%lf",0
output_perimeter db "The perimeter is: %5.3lf",10,0
output_average db "The length of the average side is: %5.3lf.",10,0

segment .bss  ;Reserved for uninitialized data

segment .text ;Reserved for executing instructions.

perimeter:

push rbp
mov  rbp,rsp
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags

;Registers rax, rip, and rsp are usually not backed up.
push qword 0

;Display a welcome message to the viewer.

mov rax, 0
mov rdi, welcome1 ;Welcome to an friendly assembly program by David N.
call printf

;============= Begin section to input exactly one float the height ========================================================
push qword 0
;Display a prompt message asking for inputs
mov rax, 0
mov rdi, heightinput          ;"Enter the height: "
call printf
pop rax

;Begin the scanf block
push qword 0
mov rax, 0
mov rdi, height
mov rsi, rsp
call scanf
movsd xmm10, [rsp]

pop rax

;============= Begin section to input exactly one float the width ========================================================
push qword 0
;Display a prompt message asking for inputs
mov rax, 0
mov rdi, widthinput          ;"Enter the width: "
call printf
pop rax

;Begin the scanf block
push qword 0
mov rax, 0
mov rdi, height
mov rsi, rsp
call scanf
movsd xmm9, [rsp]

pop rax

;====================perimeter=============
addsd xmm10, xmm9
multsd xmm10, [2]
;Display one float number
mov rax, 1                     ;printf will need access to thhis many 
mov rdi, output_perimeter      ;"The perimeter is %5.3lf"
movsd xmm0, xmm10
call printf

      
;===== Restore original values to integer registers ===================================================================
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

ret