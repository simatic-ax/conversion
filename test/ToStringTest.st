USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS ToStringTest
        VAR
            s : STRING;
        END_VAR
        {Test}
        METHOD PUBLIC Convert_INT_1234_ToString_Expect_1234
            s := AnyIntToString(value := 1234);
            Equal(expected := '1234', actual := s);
            Equal(expected := 4, actual := LengthOf(s));
        END_METHOD
        
        {Test}
        METHOD PUBLIC Convert_INT_MINUS_1234_ToString_Expect_MINUS_1234
            s := AnyIntToString(value := -1234);
            Equal(expected := '-1234', actual := s);
            Equal(expected := 5, actual := LengthOf(s));
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_INT_VALUES_ToString_Expect_Value_AsString
            // 0
            s := AnyIntToString(value := 0);
            Equal(expected := '0', actual := s);
            Equal(expected := 1, actual := LengthOf(s));

            // 1
            s := AnyIntToString(value := 1);
            Equal(expected := '1', actual := s);
            Equal(expected := 1, actual := LengthOf(s));

            // 1
            s := AnyIntToString(value := -1);
            Equal(expected := '-1', actual := s);
            Equal(expected := 2, actual := LengthOf(s));

            // 99
            s := AnyIntToString(value := 99);
            Equal(expected := '99', actual := s);
            Equal(expected := 2, actual := LengthOf(s));

            // -99
            s := AnyIntToString(value := -99);
            Equal(expected := '-99', actual := s);
            Equal(expected := 3, actual := LengthOf(s));
            
            // 1234567890
            s := AnyIntToString(value := DINT#1234567890);
            Equal(expected := '1234567890', actual := s);
            Equal(expected := 10, actual := LengthOf(s));

            // -1234567890
            s := AnyIntToString(value := DINT#-1234567890);
            Equal(expected := '-1234567890', actual := s);
            Equal(expected := 11, actual := LengthOf(s));

            // 9223372036854775807
            s := AnyIntToString(value := LINT#9223372036854775807);
            Equal(expected := '9223372036854775807', actual := s);
            Equal(expected := 19, actual := LengthOf(s));

            // -9223372036854775808
            s := AnyIntToString(value := LINT#-9223372036854775808);
            Equal(expected := '-9223372036854775808', actual := s);
            Equal(expected := 20, actual := LengthOf(s));
        END_METHOD

        {Test}
        METHOD PUBLIC Convert_Integers_with_forced_sign
            // 0
            s := AnyIntToString(value := 0, mode := ConversionMode#FORCE_SIGN);
            Equal(expected := '0', actual := s);
            Equal(expected := 1, actual := LengthOf(s));

            // 1
            s := AnyIntToString(value := 1, mode := ConversionMode#FORCE_SIGN);
            Equal(expected := '+1', actual := s);
            Equal(expected := 2, actual := LengthOf(s));

            // 1
            s := AnyIntToString(value := -1, mode := ConversionMode#FORCE_SIGN);
            Equal(expected := '-1', actual := s);
            Equal(expected := 2, actual := LengthOf(s));

            // 99
            s := AnyIntToString(value := 99, mode := ConversionMode#FORCE_SIGN);
            Equal(expected := '+99', actual := s);
            Equal(expected := 3, actual := LengthOf(s));

            // -99
            s := AnyIntToString(value := -99, mode := ConversionMode#FORCE_SIGN);
            Equal(expected := '-99', actual := s);
            Equal(expected := 3, actual := LengthOf(s));

            // 9223372036854775807
            s := AnyIntToString(value := LINT#9223372036854775807, mode := ConversionMode#FORCE_SIGN);
            Equal(expected := '+9223372036854775807', actual := s);
            Equal(expected := 20, actual := LengthOf(s));

            // -9223372036854775808
            s := AnyIntToString(value := LINT#-9223372036854775808, mode := ConversionMode#FORCE_SIGN);
            Equal(expected := '-9223372036854775808', actual := s);
            Equal(expected := 20, actual := LengthOf(s));
        END_METHOD

        // Blocked by HA-1737
        // {Test(v := 1234, expStr := '1234', len := 4)}
        // METHOD PUBLIC Convert_INT_VALUES_ToString_Expect_Value_AsString
        //     VAR_INPUT
        //         v : LINT;
        //         expStr : STRING;
        //         len : INT;
        //     END_VAR
        //     ;            
        //     s := ToString(value := v);
        //     Equal(expected := expStr, actual := s);
        //     Equal(expected := len, actual := LengthOf(s));
        // END_METHOD

    END_CLASS
END_NAMESPACE