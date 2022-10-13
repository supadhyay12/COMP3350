.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
.code
	main proc
		mov EAX, 5
		sub EAX, 2
		invoke ExitProcess, 0
	main endp
end main