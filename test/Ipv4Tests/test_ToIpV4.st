USING Siemens.Simatic.S71500.IPConfiguration;
USING AxUnit.Assert;
NAMESPACE Ipv4Tests
    {TestFixture}
    CLASS TestToIp4v
        {Test}
        METHOD PUBLIC Test_valid_ip_address
            VAR
                result : BOOL;
                ipv4 : IP_V4;
                ipv4_expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.168.0.1', ipv4);
            Equal(expected := TRUE, actual := result);
            Equal(actual := ipv4, expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestInvalidIpAddress
            VAR
                result : BOOL;
                ipv4 : IP_V4;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('999.999.999.999', ipv4);
            Equal(expected := FALSE, actual := result);
            Equal(actual := ipv4, expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestEmptyIpAddress
            VAR
                result : BOOL;
                ipv4 : IP_V4;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('', ipv4);
            Equal(expected := FALSE, actual := result);
            Equal(actual := ipv4, expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIncompleteIpAddress
            VAR
                result : BOOL;
                ipv4 : IP_V4;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.168', ipv4);
            Equal(expected := FALSE, actual := result);
            Equal(actual := ipv4, expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressWithExtraDots
            VAR
                result : BOOL;
                ipv4 : IP_V4;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.168.0.1.1', ipv4);
            Equal(expected := FALSE, actual := result);
            Equal(actual := ipv4, expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressWithLetters
            VAR
                result : BOOL;
                ipv4 : IP_V4;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.abc.0.1', ipv4);
            Equal(expected := FALSE, actual := result);
            Equal(actual := ipv4, expected := ipv4_expected);
        END_METHOD

        {Test(ipAddress := '192.168.1.1', expectedResult := TRUE, expectedByte1 := BYTE#192, expectedByte2 := BYTE#168, expectedByte3 := BYTE#1, expectedByte4 := BYTE#1)}
        {Test(ipAddress := '10.0.0.1', expectedResult := TRUE, expectedByte1 := BYTE#10, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#1)}
        {Test(ipAddress := '255.255.255.255', expectedResult := TRUE, expectedByte1 := BYTE#255, expectedByte2 := BYTE#255, expectedByte3 := BYTE#255, expectedByte4 := BYTE#255)}
        {Test(ipAddress := '0.0.0.0', expectedResult := TRUE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        {Test(ipAddress := '256.256.256.256', expectedResult := FALSE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        {Test(ipAddress := '192.168.1', expectedResult := FALSE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        {Test(ipAddress := '192.168.1.1.1', expectedResult := FALSE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        {Test(ipAddress := '192.168.one.1', expectedResult := FALSE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        METHOD PUBLIC TestParameterizedIpAddress
            VAR_INPUT
                ipAddress : STRING;
                expectedResult : BOOL;
                expectedByte1 : BYTE;
                expectedByte2 : BYTE;
                expectedByte3 : BYTE;
                expectedByte4 : BYTE;
            END_VAR
            VAR
                result : BOOL;
                ipv4 : IP_V4;
                expectedIpv4 : IP_V4;
            END_VAR
            expectedIpv4[1] := expectedByte1;
            expectedIpv4[2] := expectedByte2;
            expectedIpv4[3] := expectedByte3;
            expectedIpv4[4] := expectedByte4;
            
            result := Simatic.Ax.Conversion.ToIpv4(ipAddress, ipv4);
            Equal(expected := expectedResult, actual := result);
            Equal(actual := ipv4, expected := expectedIpv4);
        END_METHOD
    END_CLASS
END_NAMESPACE
