( Forth functions to read and write memory.

  vi:ft=forth
)

( fetch byte value )
CODE C@ ( adr - n )
    ." \t mov @SP, W " NL           ( copy address )
    ." \t mov.b @W, 0(SP) " NL      ( replace TOS with value )
    ASM-NEXT
END-CODE

( store byte value )
CODE C! ( n adr - )
    TOS->R15                        ( pop address )
    TOS->R14                        ( pop value )
    ." \t mov.b R14, 0(R15) " NL    ( write to address - separate instruction b/c byte mode )
    ASM-NEXT
END-CODE

( fetch word value )
CODE @ ( adr - n )
    ." \t mov @SP, W " NL           ( copy address )
    ." \t mov @W, 0(SP) " NL        ( replace TOS with value )
    ASM-NEXT
END-CODE

( store word value )
CODE ! ( n adr - )
    TOS->W                          ( pop address )
    ." \t mov @(SP)+, 0(W) " NL     ( pop value and write to address )
    ASM-NEXT
END-CODE

