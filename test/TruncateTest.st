USING AxUnit.Assert;

NAMESPACE Simatic.Ax.Conversion

    {TestFixture}
    CLASS TestTruncate

        {Test (v := 0.0000000000001, e := 0)}
        {Test (v := 0.4, e := 0)}
        {Test (v := 0.4000011111231, e := 0)}
        {Test (v := 0.50000000000001, e := 0)}
        {Test (v := 0.9, e := 0)}
        {Test (v := 1.0, e := 1)}
        {Test (v := 1.4, e := 1)}
        {Test (v := 1.5, e := 1)}
        {Test (v := 1.9, e := 1)}
        {Test (v := 4.98235469312341234, e := 4)}
        {Test (v := 5.0219410234234, e := 5)}
        {Test (v := 9.0, e := 9)}
        {Test (v := 9.4, e := 9)}
        {Test (v := 9.5, e := 9)}
        {Test (v := 9.9, e := 9)}
        {Test (v := 10.0, e := 10)}
        {Test (v := 10.4, e := 10)}
        {Test (v := 10.5, e := 10)}
        {Test (v := 10.9, e := 10)}
        {Test (v := 100.0, e := 100)}
        {Test (v := 100.4, e := 100)}
        {Test (v := 100.5, e := 100)}
        {Test (v := 100.9, e := 100)}
        {Test (v := 1000.0, e := 1000)}
        {Test (v := 1000.4, e := 1000)}
        {Test (v := 1000.5, e := 1000)}
        {Test (v := 1000.9, e := 1000)}
        {Test (v := -0.0000000000001, e := 0)}
        {Test (v := -0.4, e := -0)}
        {Test (v := -0.4000011111231, e := -0)}
        {Test (v := -0.50000000000001, e := -0)}
        {Test (v := -0.9, e := -0)}
        {Test (v := -1.0, e := -1)}
        {Test (v := -1.4, e := -1)}
        {Test (v := -1.5, e := -1)}
        {Test (v := -1.9, e := -1)}
        {Test (v := -4.98235469312341234, e := -4)}
        {Test (v := -5.0219410234234, e := -5)}
        {Test (v := -9.0, e := -9)}
        {Test (v := -9.4, e := -9)}
        {Test (v := -9.5, e := -9)}
        {Test (v := -9.9, e := -9)}
        {Test (v := -10.0, e := -10)}
        {Test (v := -10.4, e := -10)}
        {Test (v := -10.5, e := -10)}
        {Test (v := -10.9, e := -10)}
        {Test (v := -100.0, e := -100)}
        {Test (v := -100.4, e := -100)}
        {Test (v := -100.5, e := -100)}
        {Test (v := -100.9, e := -100)}
        {Test (v := -1000.0, e := -1000)}
        {Test (v := -1000.4, e := -1000)}
        {Test (v := -1000.5, e := -1000)}
        {Test (v := -1000.9, e := -1000)}
        METHOD PUBLIC Test_Different_LREALS
            VAR_INPUT
                v : LREAL;
                e : DINT;
            END_VAR
            Equal(expected := e, actual := TRUNC(v));
        END_METHOD

        {Test (v := REAL#0.0000000000001, e := 0)}
        {Test (v := REAL#0.4, e := 0)}
        {Test (v := REAL#0.4000011111231, e := 0)}
        {Test (v := REAL#0.50000000000001, e := 0)}
        {Test (v := REAL#0.9, e := 0)}
        {Test (v := REAL#1.0, e := 1)}
        {Test (v := REAL#1.4, e := 1)}
        {Test (v := REAL#1.5, e := 1)}
        {Test (v := REAL#1.9, e := 1)}
        {Test (v := REAL#4.98235469312341234, e := 4)}
        {Test (v := REAL#5.0219410234234, e := 5)}
        {Test (v := REAL#9.0, e := 9)}
        {Test (v := REAL#9.4, e := 9)}
        {Test (v := REAL#9.5, e := 9)}
        {Test (v := REAL#9.9, e := 9)}
        {Test (v := REAL#10.0, e := 10)}
        {Test (v := REAL#10.4, e := 10)}
        {Test (v := REAL#10.5, e := 10)}
        {Test (v := REAL#10.9, e := 10)}
        {Test (v := REAL#100.0, e := 100)}
        {Test (v := REAL#100.4, e := 100)}
        {Test (v := REAL#100.5, e := 100)}
        {Test (v := REAL#100.9, e := 100)}
        {Test (v := REAL#1000.0, e := 1000)}
        {Test (v := REAL#1000.4, e := 1000)}
        {Test (v := REAL#1000.5, e := 1000)}
        {Test (v := REAL#1000.9, e := 1000)}
        {Test (v := REAL#-0.0000000000001, e := 0)}
        {Test (v := REAL#-0.4, e := -0)}
        {Test (v := REAL#-0.4000011111231, e := -0)}
        {Test (v := REAL#-0.50000000000001, e := -0)}
        {Test (v := REAL#-0.9, e := -0)}
        {Test (v := REAL#-1.0, e := -1)}
        {Test (v := REAL#-1.4, e := -1)}
        {Test (v := REAL#-1.5, e := -1)}
        {Test (v := REAL#-1.9, e := -1)}
        {Test (v := REAL#-4.98235469312341234, e := -4)}
        {Test (v := REAL#-5.0219410234234, e := -5)}
        {Test (v := REAL#-9.0, e := -9)}
        {Test (v := REAL#-9.4, e := -9)}
        {Test (v := REAL#-9.5, e := -9)}
        {Test (v := REAL#-9.9, e := -9)}
        {Test (v := REAL#-10.0, e := -10)}
        {Test (v := REAL#-10.4, e := -10)}
        {Test (v := REAL#-10.5, e := -10)}
        {Test (v := REAL#-10.9, e := -10)}
        {Test (v := REAL#-100.0, e := -100)}
        {Test (v := REAL#-100.4, e := -100)}
        {Test (v := REAL#-100.5, e := -100)}
        {Test (v := REAL#-100.9, e := -100)}
        {Test (v := REAL#-1000.0, e := -1000)}
        {Test (v := REAL#-1000.4, e := -1000)}
        {Test (v := REAL#-1000.5, e := -1000)}
        {Test (v := REAL#-1000.9, e := -1000)}
        METHOD PUBLIC Test_Different_REALS
            VAR_INPUT
                v : REAL;
                e : DINT;
            END_VAR
            Equal(expected := e, actual := TRUNC(v));
        END_METHOD

    END_CLASS

END_NAMESPACE
