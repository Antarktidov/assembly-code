;Программа на ессемблере, которая спрашивает имя у пользователя
;и приветсвует его.
;Архитекутра: x64
;ОС - Linux
;Ассемблер - nasm
global _start           ; делаем метку метку _start видимой извне
 
section .data   ; секция данных
message1: db ">What's your name?",10
message2: db ">Nice name, "
BUFSIZE: db 20

section .bss
buffer resb 10
 
section .text           ; объявление секции кода
_start:                 ; объявление метки _start - точки входа в программу

    ;Спрашиваем у пользователя: "What's your name?"
    mov rax, 1          ; 1 - номер системного вызова функции write
    mov rdi, 1          ; 1 - дескриптор файла стандартного вызова stdout
    mov rsi, message1    ; адрес строки для вывод
    mov rdx, 19         ; количество байтов
    syscall             ; выполняем системный вызов write

    ;Получаем имя"
    mov eax, 0          ; 0 - номер системного вызова функции read
    mov edi, 0         ; 0 - дескриптор файла стандартного вызова stdin
    mov rsi, buffer
    mov edx, [BUFSIZE]
    syscall

    ;Выводим: "Nice name, "
    mov rax, 1          ; 1 - номер системного вызова функции write
    mov rdi, 1          ; 1 - дескриптор файла стандартного вызова stdout
    mov rsi, message2    ; адрес строки для вывод
    mov rdx, 12         ; количество байтов
    syscall             ; выполняем системный вызов write

    ;Выводим имя
    mov rax, 1          ; 1 - номер системного вызова функции write
    mov rdi, 1          ; 1 - дескриптор файла стандартного вызова stdout
    mov rsi, buffer     ; адрес строки для вывода
    mov rdx, BUFSIZE         ; количество байтов
    syscall             ; выполняем системный вызов write

    ;Завершаем
    mov rax, 60         ; 60 - номер системного вызова exit
    syscall             ; выполняем системный вызов exit