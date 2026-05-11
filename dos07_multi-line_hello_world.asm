; Программа на ассемблере, которая выводит Hello World
; посимвольно - каждый символ на новой строке
; ОС - DOS (dosbox)
; формат испольняемого файла - COM
; Ассемблер - tasm

.model tiny
.code
    org 100h                ; начало COM-файла
start:
    mov cx, 11              ; длина строки Hello World
    mov ah, 2               ; номер функции DOS "вывод символа"
    xor bx, bx              ; счётчик символа в строки - изнаально - 0
cloop:
    mov dl, 0Ah             ; выводим сивмол новой строки
    int 21h                 ; вызов DOS
    mov dl, [message+bx]    ; выводим очередной символ Hello World
    int 21h                 ; вызов DOS
    inc bx                  ; увеличиваем счётчик символа новой строки на 1
continue_loop:
    loop cloop              ; продолжить цикл
    ret                     ; завершение COM-файла
message db "Hello World", 0Dh, 0Ah, '$' ; строка для вывода
    end start