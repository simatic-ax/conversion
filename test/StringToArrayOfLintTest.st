USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Strings.ToArray
    {TestFixture}
    CLASS StringToArrayOfLIntTest
        VAR
            arr: ARRAY[0..3] OF LINT;
            test : LINT;
        END_VAR

        {Test}
        METHOD PUBLIC EmptyArray_ReturnsFalse
            VAR 
                str: STRING := '';
                succes: BOOL;
            END_VAR
            succes := ToArray.OfLint(str, arr);
            Equal(FALSE, succes);

            str:= '   ';
            succes := ToArray.OfLint(str, arr);
            Equal(FALSE, succes);
        END_METHOD

        {Test}
        METHOD PUBLIC NotArray_ReturnsFalse
            VAR 
                str: STRING := 'hello';
                succes: BOOL;
            END_VAR
            succes := OfLint(str, arr);
            Equal(FALSE, succes);
        END_METHOD

        {Test}
        METHOD PUBLIC WrongArray_ReturnsFalse
            VAR 
                str: STRING := '["hello", "goodbye"]';
                succes: BOOL;
            END_VAR
            succes := OfLint(str, arr);
            Equal(FALSE, succes);
        END_METHOD

        {Test}
        METHOD PUBLIC Array_Converts
            VAR 
                str: STRING := '[12, 345, 6789, 101112]';
                succes: BOOL;
            END_VAR
            succes := OfLint(str, arr);
            Equal(TRUE, succes);
            Equal(LINT#12, arr[0]);
            Equal(LINT#345, arr[1]);
            Equal(LINT#6789, arr[2]);
            Equal(LINT#101112, arr[3]);
        END_METHOD

        {Test}
        METHOD PUBLIC Array_Converts_with_spaces
            VAR 
                str: STRING := '   [   12,   345   ,    6789    ,    101112    ]   ';
                succes: BOOL;
            END_VAR
            succes := OfLint(str, arr);
            Equal(TRUE, succes);
            Equal(LINT#12, arr[0]);
            Equal(LINT#345, arr[1]);
            Equal(LINT#6789, arr[2]);
            Equal(LINT#101112, arr[3]);
        END_METHOD

        {Test}
        METHOD PUBLIC Array_Converts_toSmallArray
            VAR 
                str: STRING := '[12, 345, 6789, 101112, 1234]';
                succes: BOOL;
            END_VAR
            test := 999;
            succes := OfLint(str, arr);
            Equal(TRUE, succes);
            Equal(LINT#12, arr[0]);
            Equal(LINT#345, arr[1]);
            Equal(LINT#6789, arr[2]);
            Equal(LINT#101112, arr[3]);
            Equal(LINT#999, test);
        END_METHOD

        {Test}
        METHOD PUBLIC Array_Converts_toBigArray
            VAR 
                str: STRING := '[12, 345, 6789]';
                succes: BOOL;
            END_VAR
            test := 999;
            succes := OfLint(str, arr);
            Equal(TRUE, succes);
            Equal(LINT#12, arr[0]);
            Equal(LINT#345, arr[1]);
            Equal(LINT#6789, arr[2]);
            Equal(LINT#999, test);
        END_METHOD

    END_CLASS
END_NAMESPACE