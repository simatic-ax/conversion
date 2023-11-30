USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS StrinToArrayIntTest
        VAR PROTECTED
            s10 : STRING := '0123456789';
            s16 : STRING := '0123456789ABCDEF';
            a0_9 : ARRAY[0..9] OF CHAR;
            a10_19 : ARRAY[10..19] OF CHAR;

            a0_12 : ARRAY[0..12] OF CHAR;
            a10_22 : ARRAY[10..12] OF CHAR;
            len : DINT;
        END_VAR

        {Test}
        METHOD PUBLIC Test_array_and_string_length_is_equal_expect_lenght_10
            len := Strings.ToArray.OfCharCount(s10, a0_9);
            Equal(expected := 10, actual := len);
            Equal(expected := '0', actual := a0_9[0]);
            Equal(expected := '1', actual := a0_9[1]);
            Equal(expected := '8', actual := a0_9[8]);
            Equal(expected := '9', actual := a0_9[9]);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_array_starting_with_10_and_string_length_is_equal_expect_lenght_10
            len := Strings.ToArray.OfCharCount(s10, a10_19);
            Equal(expected := 10, actual := len);
            Equal(expected := '0', actual := a10_19[10]);
            Equal(expected := '1', actual := a10_19[11]);
            Equal(expected := '8', actual := a10_19[18]);
            Equal(expected := '9', actual := a10_19[19]);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_array_and_string_length_is_longer_expect_lenght_10
            len := Strings.ToArray.OfCharCount(s16, a0_9);
            Equal(expected := 10, actual := len);
            Equal(expected := '0', actual := a0_9[0]);
            Equal(expected := '1', actual := a0_9[1]);
            Equal(expected := '8', actual := a0_9[8]);
            Equal(expected := '9', actual := a0_9[9]);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_array_starting_with_10_and_string_length_is_longer_expect_lenght_10
            len := Strings.ToArray.OfCharCount(s16, a10_19);
            Equal(expected := 10, actual := len);
            Equal(expected := '0', actual := a10_19[10]);
            Equal(expected := '1', actual := a10_19[11]);
            Equal(expected := '8', actual := a10_19[18]);
            Equal(expected := '9', actual := a10_19[19]);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_array_and_string_length_buffer_is_longer_expect_lenght_10
            len := Strings.ToArray.OfCharCount(s10, a0_12);
            Equal(expected := 10, actual := len);
            Equal(expected := '0', actual := a0_12[0]);
            Equal(expected := '1', actual := a0_12[1]);
            Equal(expected := '8', actual := a0_12[8]);
            Equal(expected := '9', actual := a0_12[9]);
            Equal(expected := TO_CHAR(BYTE#0), actual := a0_12[10]);
            Equal(expected := TO_CHAR(BYTE#0), actual := a0_12[11]);
            Equal(expected := TO_CHAR(BYTE#0), actual := a0_12[12]);
        
            len := Strings.ToArray.OfCharCount(s16, a0_12);
            Equal(expected := 13, actual := len);
        END_METHOD


        {Test}
        METHOD PUBLIC Test_array_and_string_length_buffer_is_shorter_expect_lenght_13
        
            len := Strings.ToArray.OfCharCount(s16, a0_12);
            Equal(expected := 13, actual := len);
            Equal(expected := '0', actual := a0_12[0]);
            Equal(expected := '1', actual := a0_12[1]);
            Equal(expected := '8', actual := a0_12[8]);
            Equal(expected := '9', actual := a0_12[9]);
            Equal(expected := 'A', actual := a0_12[10]);
            Equal(expected := 'B', actual := a0_12[11]);
            Equal(expected := 'C', actual := a0_12[12]);
        END_METHOD
    END_CLASS
END_NAMESPACE