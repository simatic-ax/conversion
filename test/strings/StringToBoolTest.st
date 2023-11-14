USING AxUnit.Assert;
USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS StringToBoolTest
        VAR
            str: STRING;
            value: BOOL;
            success: BOOL;
        END_VAR

        {Test}
        METHOD PUBLIC ReturnsFalseWhenStringIsEmpty
            str:= '';
            success := StringToBool(str, value);
            Equal(FALSE, success);
        END_METHOD

        {Test}
        METHOD PUBLIC ValueIsFalseWhenStringIsFalse
            str:= 'FALSE';
            success := StringToBool(str, value);
            Equal(TRUE, success);
            Equal(FALSE, value);

            str:= 'false';
            success := StringToBool(str, value);
            Equal(TRUE, success);
            Equal(FALSE, value);

            str:= 'FalSE';
            success := StringToBool(str, value);
            Equal(TRUE, success);
            Equal(FALSE, value);
        END_METHOD

        {Test}
        METHOD PUBLIC ValueIsFalseWhenStringIsTrue
            str:= 'TRUE';
            success := StringToBool(str, value);
            Equal(TRUE, success);
            Equal(TRUE, value);

            str:= 'true';
            success := StringToBool(str, value);
            Equal(TRUE, success);
            Equal(TRUE, value);

            str:= 'TruE';
            success := StringToBool(str, value);
            Equal(TRUE, success);
            Equal(TRUE, value);
        END_METHOD

    END_CLASS
END_NAMESPACE