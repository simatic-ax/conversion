USING AxUnit.Assert;
using System.Strings;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS TestDifferentTypeConversionsToInt
        VAR PROTECTED
            s : STRING;
            res : BOOL;
            
        END_VAR

        {Test}
        METHOD PUBLIC Test_SINT
            VAR_TEMP
                val : SINT;
            END_VAR
            s := '0';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := 0, actual := val);

            s := '127';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := 127, actual := val);

            s := '-128';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := -128, actual := val);
        
            s := '128';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);

            s := '-129';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_INT
            VAR_TEMP
                val : INT;
            END_VAR
            s := '0';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := 0, actual := val);

            s := '32767';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := 32767, actual := val);

            s := '-32768';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := -32768, actual := val);
        
            s := '32768';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);

            s := '-32769';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_DINT
            VAR_TEMP
                val : DINT;
            END_VAR
            s := '0';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := 0, actual := val);

            s := '2147483647';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := DINT#2147483647, actual := val);

            s := '-2147483648';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := DINT#-2147483648, actual := val);
        
            s := '2147483648';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);

            s := '-2147483649';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_LINT
            VAR_TEMP
                val : LINT;
            END_VAR
            s := '0';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := 0, actual := val);

            s := '9223372036854775807';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := LINT#9223372036854775807, actual := val);

            s := '-9223372036854775808';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := LINT#-9223372036854775808, actual := val);
        
            s := '9223372036854775808';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);

            s := '-9223372036854775809';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_USINT
            VAR_TEMP
                val : USINT;
            END_VAR
            s := '0';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := 0, actual := val);

            s := '255';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := LINT#255, actual := val);

            s := '+255';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := LINT#255, actual := val);
        
            s := '256';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);

            s := '-1';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := 0, actual := val);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_UINT
            VAR_TEMP
                val : UINT;
            END_VAR
            s := '0';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := UINT#0, actual := val);

            s := '65535';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := UINT#65535, actual := val);

            s := '+65535';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := UINT#65535, actual := val);
        
            s := '65536';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := UINT#0, actual := val);

            s := '-1';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := UINT#0, actual := val);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_UDINT
            VAR_TEMP
                val : UDINT;
            END_VAR
            s := '0';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := UDINT#0, actual := val);

            s := '4294967295';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := UDINT#4294967295, actual := val);

            s := '+4294967295';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := UDINT#4294967295, actual := val);
        
            s := '4294967296';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := UDINT#0, actual := val);

            s := '-1';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := UDINT#0, actual := val);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_ULINT
            VAR_TEMP
                val : ULINT;
            END_VAR
            s := '0';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := ULINT#0, actual := val);

            s := '18446744073709551615';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := ULINT#18446744073709551615, actual := val);

            s := '+18446744073709551615';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := TRUE, actual := res);
            Equal(expected := ULINT#18446744073709551615, actual := val);
        
            s := '-1';
            res := Strings.ToInt(str := s, value => val);
            Equal(expected := FALSE, actual := res);
            Equal(expected := ULINT#0, actual := val);
        END_METHOD

    END_CLASS
END_NAMESPACE