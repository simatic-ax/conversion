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

        {Test(str := STRING#'', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'+', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'-', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'0', value := ULINT#0, success :=TRUE)}
        {Test(str := STRING#'1', value := ULINT#1, success :=TRUE)}
        {Test(str := STRING#'15', value := ULINT#15, success :=TRUE)}
        {Test(str := STRING#'18446744073709551600', value := ULINT#18446744073709551600, success :=TRUE)}
        {Test(str := STRING#'18446744073709551601', value := ULINT#18446744073709551601, success :=TRUE)}
        {Test(str := STRING#'18446744073709551602', value := ULINT#18446744073709551602, success :=TRUE)}
        {Test(str := STRING#'18446744073709551603', value := ULINT#18446744073709551603, success :=TRUE)}
        {Test(str := STRING#'18446744073709551604', value := ULINT#18446744073709551604, success :=TRUE)}
        {Test(str := STRING#'18446744073709551605', value := ULINT#18446744073709551605, success :=TRUE)}
        {Test(str := STRING#'18446744073709551606', value := ULINT#18446744073709551606, success :=TRUE)}
        {Test(str := STRING#'18446744073709551607', value := ULINT#18446744073709551607, success :=TRUE)}
        {Test(str := STRING#'18446744073709551608', value := ULINT#18446744073709551608, success :=TRUE)}
        {Test(str := STRING#'18446744073709551609', value := ULINT#18446744073709551609, success :=TRUE)}
        {Test(str := STRING#'18446744073709551610', value := ULINT#18446744073709551610, success :=TRUE)}
        {Test(str := STRING#'18446744073709551611', value := ULINT#18446744073709551611, success :=TRUE)}
        {Test(str := STRING#'18446744073709551612', value := ULINT#18446744073709551612, success :=TRUE)}
        {Test(str := STRING#'18446744073709551613', value := ULINT#18446744073709551613, success :=TRUE)}
        {Test(str := STRING#'18446744073709551614', value := ULINT#18446744073709551614, success :=TRUE)}
        {Test(str := STRING#'18446744073709551615', value := ULINT#18446744073709551615, success :=TRUE)}
        {Test(str := STRING#'18446744073709551616', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551617', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551618', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551619', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551620', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551621', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551622', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551623', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551624', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551625', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551626', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551636', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551746', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'18446744073709551800', value := ULINT#0, success :=FALSE)}
        {Test(str := STRING#'20000000000000000000', value := ULINT#0, success :=FALSE)}
        METHOD PUBLIC Convert_STRING_TO_ULINT
            VAR_INPUT
                str : STRING;
                value : ULINT;
                success : BOOL;
            END_VAR
            VAR_TEMP
                resVal : ULINT;
            END_VAR
            res := StringToULint(str := str, value => resVal);
            Equal(expected := value, actual := resVal);
            Equal(expected := success, actual := res);
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