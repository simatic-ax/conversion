USING AxUnit.Assert;
using System.Strings;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS TestDifferentTypeConversions
        {Test}
        METHOD PUBLIC Test_SINT
            Equal(expected := '0', actual := Integer.ToString(value := SINT#0));
            Equal(expected := '127', actual := Integer.ToString(value := SINT#127));
            Equal(expected := '+127', actual := Integer.ToString(value := USINT#127, mode := ConversionMode#FORCE_SIGN));
            Equal(expected := '-128', actual := Integer.ToString(value := SINT#-128));
        END_METHOD

        METHOD PUBLIC Test_USINT
            Equal(expected := '0', actual := Integer.ToString(value := USINT#0));
            Equal(expected := '255', actual := Integer.ToString(value := USINT#255));            
            Equal(expected := '+255', actual := Integer.ToString(value := USINT#255, mode := ConversionMode#FORCE_SIGN));
        END_METHOD

        METHOD PUBLIC Test_INT
            Equal(expected := '0', actual := Integer.ToString(value := INT#0));
            Equal(expected := '32767', actual := Integer.ToString(value := INT#32767));
            Equal(expected := '+32767', actual := Integer.ToString(value := INT#32767, mode := ConversionMode#FORCE_SIGN));
            Equal(expected := '-32768', actual := Integer.ToString(value := INT#-32768));

        END_METHOD

        METHOD PUBLIC Test_UINT
            Equal(expected := '0', actual := Integer.ToString(value := UINT#0));
            Equal(expected := '65535', actual := Integer.ToString(value := UINT#65535));
            Equal(expected := '+65535', actual := Integer.ToString(value := UINT#65535, mode := ConversionMode#FORCE_SIGN));

        END_METHOD

        METHOD PUBLIC Test_DINT
            Equal(expected := '0', actual := Integer.ToString(value := DINT#0));
            Equal(expected := '2147483647', actual := Integer.ToString(value := DINT#2147483647));
            Equal(expected := '+2147483647', actual := Integer.ToString(value := UDINT#2147483647, mode := ConversionMode#FORCE_SIGN));
            Equal(expected := '-2147483648', actual := Integer.ToString(value := DINT#-2147483648));
        END_METHOD

        METHOD PUBLIC Test_UDINT
            Equal(expected := '0', actual := Integer.ToString(value := UDINT#0));
            Equal(expected := '+4294967295', actual := Integer.ToString(value := UDINT#4294967295, mode := ConversionMode#FORCE_SIGN));
            Equal(expected := '4294967295', actual := Integer.ToString(value := UDINT#4294967295));
        END_METHOD

        METHOD PUBLIC Test_LINT
            Equal(expected := '0', actual := Integer.ToString(value := DINT#0));
            Equal(expected := '9223372036854775807', actual := Integer.ToString(value := LINT#9223372036854775807));
            Equal(expected := '+9223372036854775807', actual := Integer.ToString(value := LINT#9223372036854775807, mode := ConversionMode#FORCE_SIGN));
            Equal(expected := '-9223372036854775808', actual := Integer.ToString(value := LINT#-9223372036854775808));
        END_METHOD

        METHOD PUBLIC Test_ULINT
            Equal(expected := '0', actual := Integer.ToString(value := UDINT#0));
            Equal(expected := '18446744073709551615', actual := Integer.ToString(value := ULINT#18446744073709551615));
            Equal(expected := '+18446744073709551615', actual := Integer.ToString(value := ULINT#18446744073709551615, mode := ConversionMode#FORCE_SIGN));

        END_METHOD

    END_CLASS
END_NAMESPACE