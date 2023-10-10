USING AxUnit.Assert;
NAMESPACE Simatic.Ax.Conversion.Strings
    {TestFixture}
    CLASS TestStringToHex
        VAR PROTECTED
            res : DWORD;
            ret : WORD;
        END_VAR

        {Test(str := 'a', n := 1, exp := DWORD#16#a)}
        {Test(str := 'b', n := 1, exp := DWORD#16#b)}
        {Test(str := 'c', n := 1, exp := DWORD#16#c)}
        {Test(str := 'd', n := 1, exp := DWORD#16#d)}
        {Test(str := 'e', n := 1, exp := DWORD#16#e)}
        {Test(str := 'f', n := 1, exp := DWORD#16#f)}
        {Test(str := 'A', n := 1, exp := DWORD#16#a)}
        {Test(str := 'B', n := 1, exp := DWORD#16#b)}
        {Test(str := 'C', n := 1, exp := DWORD#16#c)}
        {Test(str := 'D', n := 1, exp := DWORD#16#d)}
        {Test(str := 'E', n := 1, exp := DWORD#16#e)}
        {Test(str := 'F', n := 1, exp := DWORD#16#f)}
        {Test(str := '0', n := 1, exp := DWORD#16#0)}
        {Test(str := '1', n := 1, exp := DWORD#16#1)}
        {Test(str := '2', n := 1, exp := DWORD#16#2)}
        {Test(str := '3', n := 1, exp := DWORD#16#3)}
        {Test(str := '4', n := 1, exp := DWORD#16#4)}
        {Test(str := '5', n := 1, exp := DWORD#16#5)}
        {Test(str := '6', n := 1, exp := DWORD#16#6)}
        {Test(str := '7', n := 1, exp := DWORD#16#7)}
        {Test(str := '8', n := 1, exp := DWORD#16#8)}
        {Test(str := '9', n := 1, exp := DWORD#16#9)}
        {Test(str := 'aFFe', n := 4, exp := DWORD#16#affe)}
        {Test(str := 'aa', n := 2, exp := DWORD#16#aa)}
        {Test(str := '12', n := 2, exp := DWORD#16#12)}
        {Test(str := '123', n := 3, exp := DWORD#16#123)}
        {Test(str := '1234', n := 4, exp := DWORD#16#1234)}
        METHOD PUBLIC ConvertDifferentValidStringsToDWORD
            VAR_INPUT
                str : STRING;
                n : INT;
                exp : DWORD;
            END_VAR
            ret := ToHex(str := str, n := n, result => res);
            Equal(expected := exp, actual := res);
            Equal(expected := WORD#16#0000, actual := ret);
            ;
        END_METHOD

        {Test}
        METHOD PUBLIC InvalidCharacter
            ret := ToHex(str := 'afgh', n := 4, result => res);
            Equal(expected := WORD#16#0007, actual := ret);
        END_METHOD

        {Test}
        METHOD PUBLIC InputSmallerThanN
            ret := ToHex(str := 'af', n := 3, result => res);
            Equal(expected := WORD#16#8182, actual := ret);
        END_METHOD
        
        {Test}
        METHOD PUBLIC OutputBufferToSmall
            ret := ToHex(str := '1234567890', n := 10, result => res);
            Equal(expected := WORD#16#8482, actual := ret);
        END_METHOD
    END_CLASS
END_NAMESPACE