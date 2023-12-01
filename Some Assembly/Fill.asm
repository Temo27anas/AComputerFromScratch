 (START)
    //  numScreenRegistersToPaint -> 8192
    @8192
    D=A
    @numScreenRegistersToPaint
    M=D

    // currentScreenRegister -> 16384 (first screen register)
    @SCREEN
    D=A
    @currentScreenRegister
    M=D

    //  D = Val. keyboard. 0 => No press // Not(0)=> press
    @KBD
    D=M

    //  no press => set paint color to white
    @SETWHITE
    D; JEQ

    // If press => set paint color to black
    @SETBLACK
    0; JMP

  // Set color -> 0
  (SETWHITE)
    @color
    M=0

    @PAINT
    0;JMP

  // Set var color -> -1 (111...111)
  (SETBLACK)
    @color
    M=-1

    @PAINT
    0;JMP

  // Paint the screem
  (PAINT) //a loop
    //  D = color
    @color
    D=M

    // A ->  the screen register number and modify its value to have the value of color
    @currentScreenRegister
    A=M
    M=D

    // currentScreenRegister = currentScreenRegister + 1 (to paint the right pixels in the next loop) 
    @currentScreenRegister
    M=M+1

    // numScreenRegistersToPaint = numScreenRegistersToPaint - 1
    @numScreenRegistersToPaint
    M=M-1
    D=M

    // if numScreenRegistersToPaint = 0 => go to start program
    @START
    D; JEQ

    // if numScreenRegistersToPaint = not 0, continue painting
    @PAINT
    0; JMP
