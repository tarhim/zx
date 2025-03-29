
;test ekranu

;Trzy najmłodsze bity (0,1,2) to ink, trzy kolejne (3,4,5) paper, ;kolejny (6) to bright a ostatni (7) to flash.
;Czyli czarne na białym to 00 111 000, białe na czarnym z brightem ;01 000 111, mrugające niebieskie na czerwonym 10 010 001 itd.

ORG 32768

start


;kolor permanent
LD a, %00111000
LD (23693),a

CALL cls

LD a,2 ; 2 = górny ekran
CALL 5633


LD B,7 ; licznik koloru, w dół
petla

kolor:  LD A, B                 ; Load current color into A
        OUT (254), A            ; Set BORDER color (FEh is border/ULA port)
        AND 127
	LD(23695), a ; atrybuty tekstu
        DEC B                   ; Increment color (0-7 for 8 colors)
        CALL DELAY
        PUSH BC

LD A,255
LD (23692), A ; wyłączenie scrolla

LD de,tekst ; adres tekstu testowego
LD bc,koniec_tekstu - tekst
CALL 8252 ; załadowanie tekstu procedurą ROM
POP BC

JP petla ; nieskończona pętla

DELAY:  LD DE, 00FFFh           ; Large delay value
DELAY_LOOP:
        DEC DE
        LD A, D
        OR E
        JP NZ, DELAY_LOOP       ; Loop until DE = 0
 RET      

tekst 
DEFM "TEST"
koniec_tekstu

cls:

LD HL, 16384                  ; Start of screen memory
        LD DE, 16385
        LD BC, 6912             ; 6912 bytes for full ZX Spectrum screen
        LD (HL), 0              ; Clear first byte
        LDIR      
	    RET
	
END start
