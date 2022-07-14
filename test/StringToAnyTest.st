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
        {Test(str := STRING#'2', value := ULINT#2, success :=TRUE)}
        {Test(str := STRING#'3', value := ULINT#3, success :=TRUE)}
        {Test(str := STRING#'4', value := ULINT#4, success :=TRUE)}
        {Test(str := STRING#'5', value := ULINT#5, success :=TRUE)}
        {Test(str := STRING#'6', value := ULINT#6, success :=TRUE)}
        {Test(str := STRING#'7', value := ULINT#7, success :=TRUE)}
        {Test(str := STRING#'8', value := ULINT#8, success :=TRUE)}
        {Test(str := STRING#'9', value := ULINT#9, success :=TRUE)}
        {Test(str := STRING#'10', value := ULINT#10, success :=TRUE)}
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

        {Test(str := STRING#'', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'+', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'-', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'0', value := LINT#0, success :=TRUE)}
        {Test(str := STRING#'1', value := LINT#1, success :=TRUE)}
        {Test(str := STRING#'2', value := LINT#2, success :=TRUE)}
        {Test(str := STRING#'3', value := LINT#3, success :=TRUE)}
        {Test(str := STRING#'4', value := LINT#4, success :=TRUE)}
        {Test(str := STRING#'5', value := LINT#5, success :=TRUE)}
        {Test(str := STRING#'6', value := LINT#6, success :=TRUE)}
        {Test(str := STRING#'7', value := LINT#7, success :=TRUE)}
        {Test(str := STRING#'8', value := LINT#8, success :=TRUE)}
        {Test(str := STRING#'9', value := LINT#9, success :=TRUE)}
        {Test(str := STRING#'10', value := LINT#10, success :=TRUE)}
        {Test(str := STRING#'15', value := LINT#15, success :=TRUE)}
        {Test(str := STRING#'-0', value := LINT#0, success :=TRUE)}
        {Test(str := STRING#'-1', value := LINT#-1, success :=TRUE)}
        {Test(str := STRING#'-2', value := LINT#-2, success :=TRUE)}
        {Test(str := STRING#'-3', value := LINT#-3, success :=TRUE)}
        {Test(str := STRING#'-4', value := LINT#-4, success :=TRUE)}
        {Test(str := STRING#'-5', value := LINT#-5, success :=TRUE)}
        {Test(str := STRING#'-6', value := LINT#-6, success :=TRUE)}
        {Test(str := STRING#'-7', value := LINT#-7, success :=TRUE)}
        {Test(str := STRING#'-8', value := LINT#-8, success :=TRUE)}
        {Test(str := STRING#'-9', value := LINT#-9, success :=TRUE)}
        {Test(str := STRING#'-10', value := LINT#-10, success :=TRUE)}
        {Test(str := STRING#'-15', value := LINT#-15, success :=TRUE)}
        {Test(str := STRING#'9223372036854775799', value := LINT#9223372036854775799, success :=TRUE)}
        {Test(str := STRING#'9223372036854775800', value := LINT#9223372036854775800, success :=TRUE)}
        {Test(str := STRING#'9223372036854775801', value := LINT#9223372036854775801, success :=TRUE)}
        {Test(str := STRING#'9223372036854775802', value := LINT#9223372036854775802, success :=TRUE)}
        {Test(str := STRING#'9223372036854775803', value := LINT#9223372036854775803, success :=TRUE)}
        {Test(str := STRING#'9223372036854775804', value := LINT#9223372036854775804, success :=TRUE)}
        {Test(str := STRING#'9223372036854775805', value := LINT#9223372036854775805, success :=TRUE)}
        {Test(str := STRING#'9223372036854775806', value := LINT#9223372036854775806, success :=TRUE)}
        {Test(str := STRING#'9223372036854775807', value := LINT#9223372036854775807, success :=TRUE)}
        {Test(str := STRING#'9223372036854775808', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'9223372036854775809', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'9223372036854775810', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'9223372036854775811', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'19223372036854775811', value := LINT#0, success :=FALSE)}

        {Test(str := STRING#'-9223372036854775799', value := LINT#-9223372036854775799, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775800', value := LINT#-9223372036854775800, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775801', value := LINT#-9223372036854775801, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775802', value := LINT#-9223372036854775802, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775803', value := LINT#-9223372036854775803, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775804', value := LINT#-9223372036854775804, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775805', value := LINT#-9223372036854775805, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775806', value := LINT#-9223372036854775806, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775807', value := LINT#-9223372036854775807, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775808', value := LINT#-9223372036854775808, success :=TRUE)}
        {Test(str := STRING#'-9223372036854775809', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'-9223372036854775810', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'-9223372036854775811', value := LINT#0, success :=FALSE)}
        {Test(str := STRING#'-19223372036854775811', value := LINT#0, success :=FALSE)}
        METHOD PUBLIC Convert_STRING_TO_ANYINT
            VAR_INPUT
                str : STRING;
                value : LINT;
                success : BOOL;
            END_VAR
            VAR_TEMP
                resVal : LINT;
            END_VAR
            res := StringToAnyInt(str := str, value => resVal);
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