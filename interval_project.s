.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.data
.align 4
Intro: 		.asciz "Interval Light Up Project\n"
ErrMsg: 	.asciz "Didnt work\n"
pin2:		.int 2  //WiringPi pin 2 is equal to BCM 27
pin3:    	.int 3 	//WiringPi pin 3 is equal to BCM 22
pin4:    	.int 4 	//WiringPi pin 4 is equal to BCM 23
pin5:    	.int 5 	//WiringPi pin 5 is equal to BCM 24
pin6:   	.int 6 	//WiringPi pin 6 is equal to BCM 25
pin7: 		.int 7 	//WiringPi pin 7 is equal to BCM 4
end:   		.int 5
button: 	.int 26
i: 		.int 0
delay1:		.int 400
delay2:		.int 350
delay3:		.int 300
delay4:		.int 250
delay5:		.int 200
delayMs: 	.int 100
OUTPUT = 1

.text
.global main
.extern printf
.extern wiringPiSetup
.extern delay
.extern digitalWrite
.extern pinMode

main: push {lr}

// printf( "Interval Project" ) ;
ldr r0, =Intro
bl printf

// if (wiringPiSetup() == -1) {
// printf( "Didnt work" ) ;
// exit (1) ;
// }
	bl wiringPiSetup
	mov r1,#-1
	cmp r0, r1
	bne init
	ldr r0, =ErrMsg
	bl printf
	b done

// pinMode(pin, OUTPUT) ;
init:
   	ldr    r0, =button
   	ldr    r0, [r0]
   	mov    r1, #OUTPUT
   	bl    pinMode

	ldr r0, =pin2
	ldr r0, [r0]
	mov r1, #OUTPUT
	bl pinMode

	ldr r0, =pin3
	ldr r0, [r0]
	mov r1, #OUTPUT
	bl pinMode

	ldr r0, =pin4
	ldr r0, [r0]
	mov r1, #OUTPUT
	bl pinMode

	ldr r0, =pin5
	ldr r0, [r0]
	mov r1, #OUTPUT
	bl pinMode

	ldr r0, =pin6
	ldr r0, [r0]
	mov r1, #OUTPUT
	bl pinMode

   	ldr r0, =pin7
	ldr r0, [r0]
	mov r1, #OUTPUT
	bl pinMode

// for ( i=0; i<5; i++ ) {
	ldr r4, =i
	ldr r4, [r4]
	mov r5, #4
forLoop:
	cmp r4, r5
	bgt done

// digitalWrite(pin, 1) ;
	ldr r0, =pin2
	ldr r0, [r0]
	mov r1, #1
	bl digitalWrite

	ldr r0, =pin3
	ldr r0, [r0]
	mov r1, #1
	bl digitalWrite

	ldr r0, =pin4
	ldr r0, [r0]
	mov r1, #1
	bl digitalWrite

   	ldr r0, =pin5
	ldr r0, [r0]
	mov r1, #1
	bl digitalWrite

	ldr r0, =pin6
	ldr r0, [r0]
	mov r1, #1
	bl digitalWrite

	ldr r0, =pin7
	ldr r0, [r0]
	mov r1, #1
	bl digitalWrite

// delay() ;
	ldr r0, =delay1
	ldr r0, [r0]
	bl delay

	ldr r0, =delay2
	ldr r0, [r0]
	bl delay

	ldr r0, =delay3
	ldr r0, [r0]
	bl delay

	ldr r0, =delay4
	ldr r0, [r0]
	bl delay

   	ldr r0, =delay5
	ldr r0, [r0]
	bl delay

	ldr r0, =delayMs
	ldr r0, [r0]
	bl delay


// digitalWrite(pin, 0) ;
	ldr r0, =pin2
	ldr r0, [r0]
	mov r1, #0
	bl digitalWrite

   	ldr r0, =pin3
	ldr r0, [r0]
	mov r1, #0
	bl digitalWrite

   	ldr r0, =pin4
	ldr r0, [r0]
	mov r1, #0
	bl digitalWrite

   	ldr r0, =pin5
	ldr r0, [r0]
	mov r1, #0
	bl digitalWrite

   	ldr r0, =pin6
	ldr r0, [r0]
	mov r1, #0
	bl digitalWrite

	ldr r0, =pin7
	ldr r0, [r0]
	mov r1, #0
	bl digitalWrite


// delay() ;
	ldr r0, =delay1
	ldr r0, [r0]
	bl delay

	ldr r0, =delay2
	ldr r0, [r0]
	bl delay

	ldr r0, =delay3
	ldr r0, [r0]
	bl delay

	ldr r0, =delay4
	ldr r0, [r0]
	bl delay

	ldr r0, =delay5
	ldr r0, [r0]
	bl delay

	ldr r0, =delayMs
	ldr r0, [r0]
	bl delay

	add r4, #1
	bl forLoop

done:
	pop {pc}
