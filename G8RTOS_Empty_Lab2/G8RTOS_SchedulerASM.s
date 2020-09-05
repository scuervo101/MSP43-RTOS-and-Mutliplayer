; G8RTOS_SchedulerASM.s
; Holds all ASM functions needed for the scheduler
; Note: If you have an h file, do not have a C file and an S file of the same name

	; Functions Defined
	.def G8RTOS_Start, PendSV_Handler

	; Dependencies
	.ref CurrentlyRunningThread, G8RTOS_Scheduler

	.thumb		; Set to thumb mode
	.align 2	; Align by 2 bytes (thumb mode uses allignment by 2 or 4)
	.text		; Text section

; Need to have the address defined in file 
; (label needs to be close enough to asm code to be reached with PC relative addressing)
RunningPtr: .field CurrentlyRunningThread, 32

; G8RTOS_Start
;	Sets the first thread to be the currently running thread
;	Starts the currently running thread by setting Link Register to tcb's Program Counter
G8RTOS_Start:

	.asmfunc
	; Implement this
	
	LDR R3, RunningPtr	; get pointer to CurrentlyRunningThread
	LDR R3, [R3]
	LDR R2, [R3]		;	load stack pointer from CurrentlyRunningThread
	
	ADD R2, R2, #0x38	;	increment R3 to point at thread PC
	MSR PSP, R2			;	move R3 into process stack pointer
	
	MRS R0, CONTROL		; read current control register
	ORR R0, R0, #2		;	set SPSEL
	MSR CONTROL, R0		;	store control register
	ISB					; recommended when updating control register
	
	POP {LR}			; get entry point	
	POP {R0}			; remove PSR
	
	CPSIE I				; enable interrupts
	
	BX LR
	
	.endasmfunc

; PendSV_Handler
; - Performs a context switch in G8RTOS
; 	- Saves remaining registers into thread stack
;	- Saves current stack pointer to tcb
;	- Calls G8RTOS_Scheduler to get new tcb
;	- Set stack pointer to new stack pointer from new tcb
;	- Pops registers from thread stack
PendSV_Handler:
	
	.asmfunc
	;Implement this
	
	PUSH {LR}			; save the EXC_RETURN value
	
	MRS R0, PSP			; move process stack pointer into R0
	STMDB R0!, {R4-R11}	;	push R4 - R11 onto process stack
	
	LDR R1, RunningPtr	; get pointer to CurrentlyRunningThread
	LDR R1, [R1]		;	de-reference to ThreadControlBlock
	STR R0, [R1]		;	store R0 in ThreadControlBlock.sp (save stack pointer)
	
	BL G8RTOS_Scheduler	; swap in new tcb
	
	LDR R1, RunningPtr	; get pointer to CurrentlyRunningThread
	LDR R1, [R1]		;	de-reference to ThreadControlBlock
	LDR R0, [R1]		;	load process stack pointer from ThreadControlBlock.sp
	
	LDMIA R0!, {R4-R11}	; pop registers from process stack
	MSR PSP, R0			;	move R0 into process stack pointer (load stack pointer)
	
	POP {PC}			; popping a EXC_RETURN value into the PC ...
						;	automatically triggers the return from interrupt sequence
	
	.endasmfunc
	
	; end of the asm file
	.align
	.end
