.TITLE  BTOA             ; Program title
        .MCALL  .PRINT,.EXIT,.TTYOUT     ; System macros

HELLOMSG:       .ASCIZ  /BTOA Example/

        .EVEN                    ; Ensure we're on a word boundary

START:  .PRINT  #HELLOMSG
        MOV     #12345., R0      ; Number to convert
        JSR     PC, BTOA 
        .EXIT

BTOA:
        MOV     R0, -(SP)        ; Save R0 on stack
        MOV     R1, -(SP)        ; Save R1 on stack
        MOV     R2, -(SP)        ; Save R2 on stack

        MOV     R0, R1           ; Move number to R1 (low part of dividend)
        CLR     R0               ; Clear R0 (high part of dividend)
        DIV     #10., R0         ; Divide R0:R1 by 10, quotient in R0, remainder in R1

        TST     R0               ; Check if quotient is 0
        BEQ     PRINT            ; If quotient is 0, print digit
        JSR     PC, BTOA         ; Recursive call with quotient

PRINT:  ADD     #'0, R1          ; Convert remainder to ASCII
        MOV     R1, R0           ; Move ASCII digit to R0
        .TTYOUT R0               ; Print the digit

        MOV     (SP)+, R2        ; Restore R2
        MOV     (SP)+, R1        ; Restore R1
        MOV     (SP)+, R0        ; Restore R0
        RTS     PC               ; Return

        .END    START
                                                                                                                                                                                                                                                           