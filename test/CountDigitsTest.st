USING AxUnit.Assert;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS CountDigitsTest
        {Test(value := LINT#0, digits :=1)}
        {Test(value := LINT#1, digits :=1)}
        {Test(value := LINT#10, digits :=2)}
        {Test(value := LINT#100, digits :=3)}
        {Test(value := LINT#1000, digits :=4)}
        {Test(value := LINT#10000, digits :=5)}
        {Test(value := LINT#100000, digits :=6)}
        {Test(value := LINT#1000000, digits :=7)}
        {Test(value := LINT#10000000, digits :=8)}
        {Test(value := LINT#100000000, digits :=9)}
        {Test(value := LINT#1000000000, digits :=10)}
        {Test(value := LINT#10000000000, digits :=11)}
        {Test(value := LINT#100000000000, digits :=12)}
        {Test(value := LINT#1000000000000, digits :=13)}
        {Test(value := LINT#10000000000000, digits :=14)}
        {Test(value := LINT#100000000000000, digits :=15)}
        {Test(value := LINT#1000000000000000, digits :=16)}
        {Test(value := LINT#10000000000000000, digits :=17)}
        {Test(value := LINT#100000000000000000, digits :=18)}
        {Test(value := LINT#1000000000000000000, digits :=19)}
        {Test(value := LINT#-1, digits :=1)}
        {Test(value := LINT#-10, digits :=2)}
        {Test(value := LINT#-100, digits :=3)}
        {Test(value := LINT#-1000, digits :=4)}
        {Test(value := LINT#-10000, digits :=5)}
        {Test(value := LINT#-100000, digits :=6)}
        {Test(value := LINT#-1000000, digits :=7)}
        {Test(value := LINT#-10000000, digits :=8)}
        {Test(value := LINT#-100000000, digits :=9)}
        {Test(value := LINT#-1000000000, digits :=10)}
        {Test(value := LINT#-10000000000, digits :=11)}
        {Test(value := LINT#-100000000000, digits :=12)}
        {Test(value := LINT#-1000000000000, digits :=13)}
        {Test(value := LINT#-10000000000000, digits :=14)}
        {Test(value := LINT#-100000000000000, digits :=15)}
        {Test(value := LINT#-1000000000000000, digits :=16)}
        {Test(value := LINT#-10000000000000000, digits :=17)}
        {Test(value := LINT#-100000000000000000, digits :=18)}
        {Test(value := LINT#-1000000000000000000, digits :=19)}
        {Test(value := LINT#9, digits :=1)}
        {Test(value := LINT#99, digits :=2)}
        {Test(value := LINT#999, digits :=3)}
        {Test(value := LINT#9999, digits :=4)}
        {Test(value := LINT#99999, digits :=5)}
        {Test(value := LINT#999999, digits :=6)}
        {Test(value := LINT#9999999, digits :=7)}
        {Test(value := LINT#99999999, digits :=8)}
        {Test(value := LINT#999999999, digits :=9)}
        {Test(value := LINT#9999999999, digits :=10)}
        {Test(value := LINT#99999999999, digits :=11)}
        {Test(value := LINT#999999999999, digits :=12)}
        {Test(value := LINT#9999999999999, digits :=13)}
        {Test(value := LINT#99999999999999, digits :=14)}
        {Test(value := LINT#999999999999999, digits :=15)}
        {Test(value := LINT#9999999999999999, digits :=16)}
        {Test(value := LINT#99999999999999999, digits :=17)}
        {Test(value := LINT#999999999999999999, digits :=18)}
        {Test(value := LINT#9223372036854775807, digits :=19)}
        {Test(value := LINT#-9, digits :=1)}
        {Test(value := LINT#-99, digits :=2)}
        {Test(value := LINT#-999, digits :=3)}
        {Test(value := LINT#-9999, digits :=4)}
        {Test(value := LINT#-99999, digits :=5)}
        {Test(value := LINT#-999999, digits :=6)}
        {Test(value := LINT#-9999999, digits :=7)}
        {Test(value := LINT#-99999999, digits :=8)}
        {Test(value := LINT#-999999999, digits :=9)}
        {Test(value := LINT#-9999999999, digits :=10)}
        {Test(value := LINT#-99999999999, digits :=11)}
        {Test(value := LINT#-999999999999, digits :=12)}
        {Test(value := LINT#-9999999999999, digits :=13)}
        {Test(value := LINT#-99999999999999, digits :=14)}
        {Test(value := LINT#-999999999999999, digits :=15)}
        {Test(value := LINT#-9999999999999999, digits :=16)}
        {Test(value := LINT#-99999999999999999, digits :=17)}
        {Test(value := LINT#-999999999999999999, digits :=18)}
        {Test(value := LINT#-9223372036854775808, digits :=19)}
        METHOD PUBLIC DifferentValuesExpectCorrectDigitsLINT
            VAR_INPUT
                value : LINT;
                digits : INT;
            END_VAR
            Equal(expected := digits, actual := CountDigits(value));
        END_METHOD

        {Test(value := ULINT#0, digits :=1)}
        {Test(value := ULINT#1, digits :=1)}
        {Test(value := ULINT#10, digits :=2)}
        {Test(value := ULINT#100, digits :=3)}
        {Test(value := ULINT#1000, digits :=4)}
        {Test(value := ULINT#10000, digits :=5)}
        {Test(value := ULINT#100000, digits :=6)}
        {Test(value := ULINT#1000000, digits :=7)}
        {Test(value := ULINT#10000000, digits :=8)}
        {Test(value := ULINT#100000000, digits :=9)}
        {Test(value := ULINT#1000000000, digits :=10)}
        {Test(value := ULINT#10000000000, digits :=11)}
        {Test(value := ULINT#100000000000, digits :=12)}
        {Test(value := ULINT#1000000000000, digits :=13)}
        {Test(value := ULINT#10000000000000, digits :=14)}
        {Test(value := ULINT#100000000000000, digits :=15)}
        {Test(value := ULINT#1000000000000000, digits :=16)}
        {Test(value := ULINT#10000000000000000, digits :=17)}
        {Test(value := ULINT#100000000000000000, digits :=18)}
        {Test(value := ULINT#1000000000000000000, digits :=19)}
        {Test(value := ULINT#10000000000000000000, digits :=20)}
        {Test(value := ULINT#9, digits :=1)}
        {Test(value := ULINT#99, digits :=2)}
        {Test(value := ULINT#999, digits :=3)}
        {Test(value := ULINT#9999, digits :=4)}
        {Test(value := ULINT#99999, digits :=5)}
        {Test(value := ULINT#999999, digits :=6)}
        {Test(value := ULINT#9999999, digits :=7)}
        {Test(value := ULINT#99999999, digits :=8)}
        {Test(value := ULINT#999999999, digits :=9)}
        {Test(value := ULINT#9999999999, digits :=10)}
        {Test(value := ULINT#99999999999, digits :=11)}
        {Test(value := ULINT#999999999999, digits :=12)}
        {Test(value := ULINT#9999999999999, digits :=13)}
        {Test(value := ULINT#99999999999999, digits :=14)}
        {Test(value := ULINT#999999999999999, digits :=15)}
        {Test(value := ULINT#9999999999999999, digits :=16)}
        {Test(value := ULINT#99999999999999999, digits :=17)}
        {Test(value := ULINT#999999999999999999, digits :=18)}
        {Test(value := ULINT#9999999999999999999, digits :=19)}
        {Test(value := ULINT#18446744073709551615, digits :=20)}
        METHOD PUBLIC DifferentValuesExpectCorrectDigitsULINT
            VAR_INPUT
                value : ULINT;
                digits : INT;
            END_VAR
            Equal(expected := digits, actual := CountDigits(value));
        END_METHOD    END_CLASS
END_NAMESPACE