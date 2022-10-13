;Shanti Upadhyay
;spu0004
;Shanti_Upadhyay.asm
;Last Modified: Friday, February 25, 2022

; The objective of this program is to read a value from an array, and then place this value 
; in a separate array with the location shifted by a certain amount.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
    shift dword 2
    input byte 1, 2, 3, 4, 5, 6, 7, 8
    output byte lengthof input dup(?)	
.code
	main proc

		mov EAX, 0
		mov EBX, 0 
		mov ECX, 0 

		mov ECX, LENGTHOF input ; ECX is set to length of input
		sub ECX, shift			; subtract shift from ECX, and set result to ECX
		mov ESI, OFFSET input   ; hold input in ESI
		mov EDI, OFFSET output	; hold output in EDI
		add EDI, shift			; add EDI + 2

	l1:
		mov AL, [ESI] ; copy the value from ESI to AL
		mov [EDI], AL ; copy the value from AL into EDI
		add EDI, 1	  ; add EDI + 1 
		add ESI, 1	  ; add ESI + 1
	loop l1

		mov ECX, shift			; loop iterates n times (what shift is set to)
		mov EDI, OFFSET output  ; point back to the first index of array in EDI
		
	l2:
		mov al, [ESI] ; copy the values from ESI into al
		mov [EDI], AL ; copy the values from al into EDI
		add ESI, 1    ; add ESI + 1
		add EDI, 1    ; add EDI + 1
	loop l2

invoke ExitProcess, 0
main endp
end main