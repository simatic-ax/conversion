USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS ArrayToStringTest
        VAR PROTECTED
            array_1_10 : ARRAY[1..10] OF CHAR := ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
            array_0_9 : ARRAY[0..9] OF CHAR := ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
            exp_0_9 : STRING := '0123456789';
            exp_1_10 : STRING := '1234567890';
            empty_string : STRING;
            len : DINT;
        END_VAR

        {Test}
        METHOD PUBLIC Test_Array_ToString_End_smaller_than_start_expect_empty_string
            VAR_TEMP
                _str : STRING;
            END_VAR
            
            _str := Arrays.ToString(arr := array_0_9, startIdx := 9, endIdx := 5);
            Equal(expected := empty_string, actual := _str);
            ;
        END_METHOD

        {Test}
        METHOD PUBLIC Test_Array_ToString_without_indices_and_expect_full_string
            VAR_TEMP
                _str : STRING;
            END_VAR
            
            _str := Arrays.ToString(arr := array_0_9);
            Equal(expected := 10, actual := LengthOf(_str));
            Equal(expected := exp_0_9, actual := _str);

            _str := Arrays.ToString(arr := array_1_10);
            Equal(expected := 10, actual := LengthOf(_str));
            Equal(expected := exp_1_10, actual := _str);
            ;
        END_METHOD

        {Test}
        METHOD PUBLIC Test_Array_ToString_part_of_array_and_expect_correct_String
            VAR_TEMP
                _str : STRING;
            END_VAR
            
            _str := Arrays.ToString(arr := array_0_9, startIdx := 1, endIdx := 5); 
            exp_0_9 := '12345';
            Equal(expected := 5, actual := LengthOf(_str));
            Equal(expected := exp_0_9, actual := _str);

            _str := Arrays.ToString(arr := array_1_10, startIdx := 1, endIdx := 5);
            exp_1_10 := '23456';
            Equal(expected := 5, actual := LengthOf(_str));
            Equal(expected := exp_1_10, actual := _str);
            ;
        END_METHOD


    END_CLASS
END_NAMESPACE