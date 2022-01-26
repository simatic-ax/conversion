USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS StrinToAnyIntTest
        VAR
            val : LINT;
            val2 : ULINT;
            res : BOOL;
        END_VAR

        {Test}
        METHOD PUBLIC Convert_STRING_0_TO_LINT_0
            res := StringToAnyInt(str := '0', value => val);
            Equal(expected := 0, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_STRING_0000000000000000_TO_LINT_0
            res := StringToAnyInt(str := '0000000000000000', value => val);
            Equal(expected := 0, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_STRING_123_TO_LINT_123
            res := StringToAnyInt(str := '123', value => val);
            Equal(expected := 123, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD
        
        {Test}
        METHOD PUBLIC Convert_STRING_00000000123_TO_LINT_123
            res := StringToAnyInt(str := '123', value => val);
            Equal(expected := 123, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD
        
        {Test}
        METHOD PUBLIC Convert_STRING_PLUS_123_TO_LINT_123
            res := StringToAnyInt(str := '+00000000123', value => val);
            Equal(expected := 123, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_STRING_MINUS_0000000000123_TO_LINT_123
            res := StringToAnyInt(str := '-00000000123', value => val);
            Equal(expected := -123, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_STRING_MINUS_123_TO_LINT_123
            res := StringToAnyInt(str := '-123', value => val);
            Equal(expected := -123, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_STRING_MINUS_1234567890_TO_LINT_1234567890
            res := StringToAnyInt(str := '-1234567890', value => val);
            Equal(expected := LINT#-1234567890, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_STRING_9223372036854775807_TO_LINT_9223372036854775807
            res := StringToAnyInt(str := '9223372036854775807', value => val);
            Equal(expected := LINT#9223372036854775807, actual := val);
            Equal(expected := TRUE, actual := res);
            res := StringToAnyInt(str := '+9223372036854775807', value => val);
            Equal(expected := LINT#9223372036854775807, actual := val);
            Equal(expected := TRUE, actual := res);

        END_METHOD


        {Test}
        METHOD PUBLIC Convert_STRING_MINUS_9223372036854775808_TO_LINT_9223372036854775808
            res := StringToAnyInt(str := '-9223372036854775808', value => val);
            Equal(expected := LINT#-9223372036854775808, actual := val);
            Equal(expected := TRUE, actual := res);
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_STRING_18446744073709551615_TO_ULINT_18446744073709551615
            res := StringToULINT(str := '18446744073709551615', value => val2);
            Equal(expected := ULINT#18446744073709551615, actual := val2);
            Equal(expected := TRUE, actual := res);
            
            res := StringToULINT(str := '+18446744073709551615', value => val2);
            Equal(expected := ULINT#18446744073709551615, actual := val2);
            Equal(expected := TRUE, actual := res);
        END_METHOD


        {Test}
        METHOD PUBLIC Convert_WrongStrings_ExpectFalse
            res := StringToAnyInt(str := '+-123', value => val);
            Equal(expected := 0, actual := val);
            Equal(expected := FALSE, actual := res);

            res := StringToAnyInt(str := '000+123', value => val);
            Equal(expected := 0, actual := val);
            Equal(expected := FALSE, actual := res);

            res := StringToAnyInt(str := '1000+123', value => val);
            Equal(expected := 0, actual := val);
            Equal(expected := FALSE, actual := res);
        
            res := StringToAnyInt(str := 'aaa', value => val);
            Equal(expected := 0, actual := val);
            Equal(expected := FALSE, actual := res);

            res := StringToAnyInt(str := '12a23', value => val);
            Equal(expected := 0, actual := val);
            Equal(expected := FALSE, actual := res);

        
        END_METHOD
    END_CLASS
END_NAMESPACE