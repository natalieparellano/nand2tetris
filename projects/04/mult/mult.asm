// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Setup
@product
M=0

@R0
D=M

@i
M=D

(LOOP)
@i
D=M // Load value of i
M=M-1 // Decrement stored value of i

@SAVE
D;JEQ // Terminate loop based on previous stored value of i

@R1
D=M

@product // Increment product
M=D+M

@LOOP
0;JMP

(SAVE)
@product
D=M

@R2
M=D

(DONE)
@DONE
0;JMP
