; program for up/down 7-segment counter
; - with run/pause select and blinking decimal point
; - requires only ONE table
; - 7-segment is common-cathode (i/o board)
; - sseg pin on i/o board need to be pulsed
; - c0 is the common pin (pulled LO to enable)
;
; connections:
; - PA0-PA7 (8255) => D0-D7 (IOB)
; - PB0 => up/down select, 1=up, 0=down
; - PB1 => run/pause select, 1=run, 0 = pause
; - PC0 => sseg (IOB)
; - PC1 => c0 (IOB)
;
; note: this code can still be optimized...
 
cpu "8085.tbl"
org 2000h
lxi sp, 4000h
mvi a, 82h
out 83h
; en @ LO, c0 @ LO, the rest HI
mvi a, 0fch
out 82h
 
start_up: lxi h, table
mvi b, 10
jmp loop
 
start_dn: lxi h, table1
mvi b, 0
dcx h
inr b
 
loop:
mvi d, 6
rep: call go_datab
call delay
call go_data
call delay
sw: in 81h
ani 03h
mov c, a ; save it first
ani 02h
jz rep
dcr d
jnz rep
mov a, c
ani 01h
jz go_dn
go_up: mov a,b
ora a
jz start_up
inx h
dcr b
jnz loop
jmp start_up
go_dn: mov a,b
cpi 10
jz start_dn
dcx h
inr b
mov a,b
cpi 11
jc loop
jmp start_dn
 
go_datab: mov a, m
xri 01h
jmp latch
go_data: mov a, m
latch: out 80h
;latch seven segment data
mvi a, 00h
out 83h
mvi a, 01h
out 83h
ret
 
delay: push psw
push b
lxi b, 10000
loop1: dcx b
mov a, b
ora c
jnz loop1
pop b
pop psw
ret
 
table: dfb 0fch, 60h, 0dah, 0f2h, 066h,
dfb 0b6h, 0beh, 0e0h, 0feh, 0e6h
table1: dfb 00h