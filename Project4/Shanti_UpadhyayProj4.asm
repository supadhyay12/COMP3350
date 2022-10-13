;Shanti Upadhyay
;spu0004
;Shanti_Upadhyay.asm
;Last Modified: Friday, April 08, 2022
;No help received on Project 4

;The objective of this assignment is to create a program that will determine if two strings 
;are anagrams. If the two strings are anagrams, then EAX will have the value 1 after the 
;code has completed. If they are not anagrams, then EAX will have the value 0. 


.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    s1 byte "GARDEN"
    s2 byte "DANGER"
    c1 byte 26 dup(0)							; Counter for each letter in s1            
    c2 byte 26 dup(0)							; Counter for each letter in s2           
.code
    main proc
		mov EAX, 0								; EAX is set to 0. We will assume that we do not have an anagram
		mov EBX, 0								; EBX is set to 0
		mov ECX, sizeof s1						; ECX is set to size of s1
		
		cmp ECX, sizeof s2						; Length is compared between anagrams
		JNE NoAna							    ; Results in no anagram if string lengths do not match

		CounterLoop:                            
			movzx EDI, s1[ECX - 1]              ; Move value from s1 into EDI
			inc c1[EDI - 65]                    ; Increment counter 
			movzx EDI, s2[ECX - 1]              ; Move value from s2 into EDI
			inc c2[EDI - 65]                    ; Increment counter
		loop CounterLoop

		mov ECX, sizeof c1

		VerifyLoop:                             
			mov bl, c1[ECX - 1]                 ; Move value of c1 into b1
			cmp bl, c2[ECX - 1]                 ; Check b1 vs. the value of c2
			JNE NoAna                           ; If they are not equal, we do not have an anagram. Jump to NoAna
		loop VerifyLoop

		mov EAX, 1                              ; If the loop terminates and we have not jumped then we know we have an anagram

		NoAna:                                  
			invoke ExitProcess, 0

	main endp
end main