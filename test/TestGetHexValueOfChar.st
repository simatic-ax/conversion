USING AxUnit.Assert;
NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS TestGetHexValueOfChar
        VAR PROTECTED
            res : BYTE;
            ret : bool;
        END_VAR

        {Test(c := 'a', n := 1, exp := BYTE#16#a)}
        {Test(c := 'b', n := 1, exp := BYTE#16#b)}
        {Test(c := 'c', n := 1, exp := BYTE#16#c)}
        {Test(c := 'd', n := 1, exp := BYTE#16#d)}
        {Test(c := 'e', n := 1, exp := BYTE#16#e)}
        {Test(c := 'f', n := 1, exp := BYTE#16#f)}
        {Test(c := 'A', n := 1, exp := BYTE#16#a)}
        {Test(c := 'B', n := 1, exp := BYTE#16#b)}
        {Test(c := 'C', n := 1, exp := BYTE#16#c)}
        {Test(c := 'D', n := 1, exp := BYTE#16#d)}
        {Test(c := 'E', n := 1, exp := BYTE#16#e)}
        {Test(c := 'F', n := 1, exp := BYTE#16#f)}
        {Test(c := '0', n := 1, exp := BYTE#16#0)}
        {Test(c := '1', n := 1, exp := BYTE#16#1)}
        {Test(c := '2', n := 1, exp := BYTE#16#2)}
        {Test(c := '3', n := 1, exp := BYTE#16#3)}
        {Test(c := '4', n := 1, exp := BYTE#16#4)}
        {Test(c := '5', n := 1, exp := BYTE#16#5)}
        {Test(c := '6', n := 1, exp := BYTE#16#6)}
        {Test(c := '7', n := 1, exp := BYTE#16#7)}
        {Test(c := '8', n := 1, exp := BYTE#16#8)}
        {Test(c := '9', n := 1, exp := BYTE#16#9)}
        METHOD PUBLIC ConvertHexCharsToByteValue
            VAR_INPUT
                c : CHAR;
                n : INT;
                exp : BYTE;
            END_VAR
            ret := GetHexValueOfChar(c := c, result => res);
            Equal(expected := exp, actual := res);
            Equal(expected := TRUE, actual := ret);
            ;
        END_METHOD

        {Test}
        METHOD PUBLIC InvalidCharacter
            ret := GetHexValueOfChar(c := 'h', result => res);
            Equal(expected := FALSE, actual := ret);
        END_METHOD
    END_CLASS
END_NAMESPACE