// to compile: g++ redLed.s -lwiringPi -g -o redLed

.equ INPUT, 0
.equ OUTPUT, 1
.equ LOW, 0
.equ HIGH, 1

.equ RED_PIN, 29	// wiringPi 29 (bcm 21 / physical 40)

.align 4
.text
.global main
main:
			//int main()
	push {lr} 	//{
	bl wiringPiSetup // wiringPiSetup(); // initialize the wiringPi library

	mov r0, #RED_PIN //pinMode(29,OUTPUT); // set the wpi 29 pin for output
	mov r1, #OUTPUT
	bl pinMode	// similar to typing: gpio mode 29 output

	mov r0, #RED_PIN //digitalWrite(29,HIGH); // write high volt signal to pin 21 to turn rgb led to red
	mov r1, #HIGH
	bl digitalWrite // similar to typing: gpio write 29 1

	ldr r0, =#10000 //delay(10000); // delay for 10000 milliseconds or 10 seconds
	bl delay

	mov r0, #RED_PIN //digitalWrite(29,LOW); // write low voltage to wpi 21 to turn off the rgb led
	mov r1, #LOW
	bl digitalWrite

	mov r0, #0//return 0;
	pop {pc}//}
