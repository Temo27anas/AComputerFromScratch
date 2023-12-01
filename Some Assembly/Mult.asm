// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//>> i=R1
@1
D=M // D=Ram[1]

@i
M=D // Ram[i]=Ram[1]

//>> R2=0
@2
M=0 // Ram[2]=0

(LOOP)
    //>> if i=0 goto END
    @i
    D=M // D=Ram[i]

    @END
    D;JEQ // if D=0 goto END

    //>> R2=R2+R0
    @0
    D=M // D=Ram[0]

    @2
    M=M+D // Ram[2]=Ram[2]+D

    //>> i=i-1
    @i
    M=M-1 // Ram[i]=Ram[i]-1

    //>> goto LOOP
    @LOOP
    0;JMP // goto LOOP

(END)
    //>> END
    @END
    0;JMP // goto END





