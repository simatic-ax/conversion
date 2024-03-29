USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Strings.ToArray
    {TestFixture}
    CLASS StringToArrayOfLIntCountTest
        VAR
            arr: ARRAY[0..3] OF LINT;
        END_VAR

        {Test}
        METHOD PUBLIC EmptyArray_ReturnsFalse
            VAR 
                str: STRING := '';
                count: DINT;
            END_VAR
            
            count := ToArray.OfLintCount(str, arr);
            Equal(0, count);

            str:= '   ';
            count := ToArray.OfLintCount(str, arr);
            Equal(0, count);
        END_METHOD

        {Test}
        METHOD PUBLIC NotArray_ReturnsFalse
            VAR 
                str: STRING := 'hello';
                count: DINT;
            END_VAR
            count := ToArray.OfLintCount(str, arr);
            Equal(0, count);
        END_METHOD

        {Test}
        METHOD PUBLIC WrongArray_ReturnsFalse
            VAR 
                str: STRING := '["hello", "goodbye"]';
                count: DINT;
            END_VAR
            count := ToArray.OfLintCount(str, arr);
            Equal(0, count);
        END_METHOD

        {Test}
        METHOD PUBLIC Array_Converts
            VAR 
                str: STRING := '[12, 345, 6789, 101112]';
                count: DINT;
            END_VAR
            count := ToArray.OfLintCount(str, arr);
            Equal(4, count);
            Equal(LINT#12, arr[0]);
            Equal(LINT#345, arr[1]);
            Equal(LINT#6789, arr[2]);
            Equal(LINT#101112, arr[3]);
        END_METHOD

        {Test}
        METHOD PUBLIC Array_Converts_with_spaces
            VAR 
                str: STRING := '   [   12,   345   ,    6789    ,    101112    ]   ';
                count: DINT;
            END_VAR
            count := ToArray.OfLintCount(str, arr);
            Equal(4, count);
            Equal(LINT#12, arr[0]);
            Equal(LINT#345, arr[1]);
            Equal(LINT#6789, arr[2]);
            Equal(LINT#101112, arr[3]);
        END_METHOD

        {Test}
        METHOD PUBLIC Smaller_Array_Converts_with_spaces
            VAR 
                str: STRING := '   [   345   ,    6789    ,    101112    ]   ';
                count: DINT;
            END_VAR
            count := ToArray.OfLintCount(str, arr);
            Equal(3, count);
            Equal(LINT#345, arr[0]);
            Equal(LINT#6789, arr[1]);
            Equal(LINT#101112, arr[2]);
        END_METHOD

        {Test}
        METHOD PUBLIC Array_Converts_toSmallArray
            VAR 
                str: STRING := '[12, 345, 6789, 101112, 1234]';
                count: DINT;
            END_VAR
            count := ToArray.OfLintCount(str, arr);
            Equal(4, count);
            Equal(LINT#12, arr[0]);
            Equal(LINT#345, arr[1]);
            Equal(LINT#6789, arr[2]);
            Equal(LINT#101112, arr[3]);
        END_METHOD

        {Test}
        METHOD PUBLIC Array_Converts_toBigArray
            VAR 
                str: STRING := '[12, 345, 6789]';
                count: DINT;
            END_VAR
            count := ToArray.OfLintCount(str, arr);
            Equal(3, count);
            Equal(LINT#12, arr[0]);
            Equal(LINT#345, arr[1]);
            Equal(LINT#6789, arr[2]);
        END_METHOD

    END_CLASS
END_NAMESPACE