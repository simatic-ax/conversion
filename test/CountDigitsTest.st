USING AxUnit.Assert;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS CountDigitsTest
        {Test(value := LINT#0, digits :=1)}
        {Test(value := LINT#1, digits :=1)}
        {Test(value := LINT#10, digits :=2)}
        {Test(value := LINT#99, digits :=2)}
        {Test(value := LINT#100, digits :=3)}
        {Test(value := LINT#999, digits :=3)}
        {Test(value := LINT#1000, digits :=4)}
        {Test(value := LINT#9999, digits :=4)}
        {Test(value := LINT#10000, digits :=5)}
        {Test(value := LINT#99999, digits :=5)}
        {Test(value := LINT#100000000000000000, digits :=18)}
        {Test(value := LINT#999999999999999999, digits :=18)}
        {Test(value := LINT#1000000000000000000, digits :=19)}
        {Test(value := LINT#9223372036854775807, digits :=19)}
        {Test(value := LINT#-1, digits :=1)}
        {Test(value := LINT#-10, digits :=2)}
        {Test(value := LINT#-99, digits :=2)}
        {Test(value := LINT#-100, digits :=3)}
        {Test(value := LINT#-999, digits :=3)}
        {Test(value := LINT#-1000, digits :=4)}
        {Test(value := LINT#-9999, digits :=4)}
        {Test(value := LINT#-10000, digits :=5)}
        {Test(value := LINT#-99999, digits :=5)}
        {Test(value := LINT#-100000000000000000, digits :=18)}
        {Test(value := LINT#-999999999999999999, digits :=18)}
        {Test(value := LINT#-1000000000000000000, digits :=19)}
        {Test(value := LINT#-9223372036854775808, digits :=19)}
        METHOD PUBLIC DifferentValuesExpectCorrectDigits
            VAR_INPUT
                value : LINT;
                digits : INT;
            END_VAR
            Equal(expected := digits, actual := CountDigits(value));
        END_METHOD
    END_CLASS
END_NAMESPACE