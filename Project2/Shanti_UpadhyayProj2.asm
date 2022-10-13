;Shanti Upadhyay
;Project2.cpp
;No help received

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
		input BYTE 1,2,3,4,5,6,7,8
		shift BYTE 2
.code
		main proc

		mov EAX, 0
		mov EBX, 0
		mov ECX, 0
		mov EDX, 0

		mov ah, input[0]
		mov ah, shift

		mov al, input[1]
		mov al, shift

		mov bh, input[2]
		mov bh, shift

		mov bl, input[3]
		mov bl, shift

		mov ch, input[4]
		mov ch, shift

		mov cl, input[5]
		mov cl, shift

		mov dh, input[6]
		mov dh, shift

		mov dl, input[7]
		mov dl, shift

		invoke ExitProcess, 0
	main endp
end main
