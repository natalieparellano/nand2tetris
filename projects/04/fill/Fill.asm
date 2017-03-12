// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
// Setup
@SCREEN
D=A
@addr // Initialize addr
M=D
@8191
D=A
@addr // Set addr
M=D+M

@color
M=0 // Default is white

@KBD
D=M

@SET_BLACK
D;JNE

(SET_SCREEN)
@SCREEN
D=A

@addr
D=M-D

@LOOP
D;JLT // Start over (read keyboard) if we've done the whole screen

@color
D=M

@addr
A=M // Move to the address stored in @addr
M=D // Set color

@addr
M=M-1

@SET_SCREEN
0;JMP

(SET_BLACK)
@color
M=-1
@SET_SCREEN
0;JMP
