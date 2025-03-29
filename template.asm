;-------------------------------------------------
org 32768 ; ORG to dyrektywa kompilatora,
; mówiąca pod jaki adres
; należy skompilować program
start ; to jest etykieta, musi
; mieć nazwę inną niż
; instrukcje asm i dyrektywy
; kompilatora
;
; tutaj trzeba umieścić główny program
;
RET ; o RET będzie w dalszej części
; artykułu tutaj jest miejsce na
; dane lub inne procedury
end start ; dzięki temu
; działa --tapbas w pasmo

