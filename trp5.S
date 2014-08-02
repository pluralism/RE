;Code used to crack Tropico 5. All it does is to bypass the register dialog


;Remove debugger protection(optional):
007C60D6     90             NOP
007C60D7     90             NOP
007C60D8     90             NOP
007C60D9     90             NOP
007C60DA     90             NOP
007C60DB     90             NOP
007C60DC  |. 85C0           TEST EAX,EAX
007C60DE     EB 07          JMP SHORT Tropico5.007C60E7



;Launch the register dialog:
005C5513  |. 51             PUSH ECX                                 ; /pProcessInfo = 0018FE40
005C5514  |. 8D5424 3C      LEA EDX,DWORD PTR SS:[ESP+3C]            ; |
005C5518  |. 52             PUSH EDX                                 ; |pStartupInfo
005C5519  |. 6A 00          PUSH 0                                   ; |CurrentDir = NULL
005C551B  |. 6A 00          PUSH 0                                   ; |pEnvironment = NULL
005C551D  |. 68 00000004    PUSH 4000000                             ; |CreationFlags = CREATE_DEFAULT_ERROR_MODE
005C5522  |. 6A 00          PUSH 0                                   ; |InheritHandles = FALSE
005C5524  |. 6A 00          PUSH 0                                   ; |pThreadSecurity = NULL
005C5526  |. 6A 00          PUSH 0                                   ; |pProcessSecurity = NULL
005C5528  |. 68 58B08E00    PUSH Tropico5.008EB058                   ; |CommandLine = "AppData.exe TRP5|mmf=Local\KalypsoLauncher"
005C552D  |. 66:0FEFC0      PXOR MM0,MM0                             ; |
005C5531  |. 68 F8AF8E00    PUSH Tropico5.008EAFF8                   ; |ModuleFileName = "AppData.exe"
005C5536  |. 66:0F7F4424 48 MOVQ QWORD PTR SS:[ESP+48],MM0           ; |
005C553C  |. C74424 60 4400>MOV DWORD PTR SS:[ESP+60],44             ; |
005C5544  |. FF15 74318B00  CALL DWORD PTR DS:[<&KERNEL32.CreateProc>; \CreateProcessW



;First patch:
005C5478     E9 71010000    JMP Tropico5.005C55EE
005C547D     90             NOP



;Second patch:
005C55EE     B0 01          MOV AL,1



;Third patch(debugger, optional):
005CCCA0     90             NOP
005CCCA1     90             NOP
005CCCA2     90             NOP
005CCCA3     90             NOP
005CCCA4     90             NOP
005CCCA5     90             NOP
005CCCA6   . 85C0           TEST EAX,EAX
005CCCA8     EB 0F          JMP SHORT Tropico5.005CCCB9
