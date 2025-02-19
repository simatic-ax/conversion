USING Siemens.Simatic.S71500.IPConfiguration;
USING AxUnit.Assert;
USING Simatic.Ax.Conversion;

NAMESPACE Ipv4Tests
    {TestFixture}
    CLASS Test_IpHandlingClass
        VAR
            IpHandling, IpHandling_Stateless : IpHandling;
        END_VAR

        {TestSetup}
        METHOD PUBLIC TestSetup
            IpHandling := IpHandling_Stateless;
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressParsing
            VAR
                ipAddress : STRING := '192.168.0.1';
                expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
                result : IP_V4;
                success : BOOL;
            END_VAR
            success := IpHandling.SetIpAddress(ipAddress := ipAddress);
            IsTrue(success);
            Equal(actual := IpHandling.GetIpAddress(), expected := expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressValidation
            VAR
                validIp : STRING := '192.168.0.1';
                invalidIp : STRING := '999.999.999.999';
            END_VAR
            IsTrue(IpHandling.SetIpAddress(validIp));
            IsFalse(IpHandling.SetIpAddress(invalidIp));
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressToString
            VAR
                expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
                ipAddress : STRING := '192.168.0.1';
                result : IP_V4;
                success : BOOL;
            END_VAR
            success := IpHandling.SetIpAddress(ipAddress := ipAddress);
            result := IpHandling.GetIpAddress();
            Equal(expected, result);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_valid_ip_address
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
            END_VAR
            result := IpHandling.SetIpAddress('192.168.0.1');
            IsTrue(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestInvalidIpAddress
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := IpHandling.SetIpAddress('999.999.999.999');
            Equal(expected := FALSE, actual := result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestEmptyIpAddress
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := IpHandling.SetIpAddress('');
            IsFalse(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIncompleteIpAddress
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := IpHandling.SetIpAddress('192.168');
            IsFalse(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressWithExtraDots
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := IpHandling.SetIpAddress('192.168.0.1.1');
            IsFalse(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressWithLetters
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#0, BYTE#0, BYTE#0, BYTE#0];
            END_VAR
            result := IpHandling.SetIpAddress('192.abc.0.1');
            IsFalse(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestHttpIpAddress
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
            END_VAR
            result := IpHandling.SetIpAddress('http://192.168.0.1');
            IsTrue(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestHttpsIpAddress
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
            END_VAR
            result := IpHandling.SetIpAddress('https://192.168.0.1');
            IsTrue(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
        END_METHOD

        {Test}
        METHOD PUBLIC TestHttpIpAddressWithPort
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
                expectedPort : UINT := UINT#8080;
            END_VAR
            result := IpHandling.SetIpAddress('http://192.168.0.1:8080');
            IsTrue(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
            Equal(actual := IpHandling.GetPort(), expected := expectedPort);
        END_METHOD

        {Test}
        METHOD PUBLIC TestHttpsIpAddressWithPort
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
                expectedPort : UINT := UINT#443;
            END_VAR
            result := IpHandling.SetIpAddress('https://192.168.0.1:443');
            IsTrue(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
            Equal(actual := IpHandling.GetPort(), expected := expectedPort);
        END_METHOD

        {Test}
        METHOD PUBLIC TestHttpIpAddressDefaultPort
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
                expectedPort : UINT := UINT#0;
            END_VAR
            result := IpHandling.SetIpAddress('http://192.168.0.1');
            IsTrue(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
            Equal(actual := IpHandling.GetPort(), expected := expectedPort);
        END_METHOD

        {Test}
        METHOD PUBLIC TestHttpsIpAddressDefaultPort
            VAR
                result : BOOL;
                ipv4_expected : IP_V4 := [BYTE#192, BYTE#168, BYTE#0, BYTE#1];
                expectedPort : UINT := UINT#0;
            END_VAR
            result := IpHandling.SetIpAddress('https://192.168.0.1');
            IsTrue(result);
            Equal(actual := IpHandling.GetIpAddress(), expected := ipv4_expected);
            Equal(actual := IpHandling.GetPort(), expected := expectedPort);
        END_METHOD

        {Test(ipAddress := '192.168.1.1', expectedSuccess := TRUE, expectedByte1 := BYTE#192, expectedByte2 := BYTE#168, expectedByte3 := BYTE#1, expectedByte4 := BYTE#1)}
        {Test(ipAddress := '10.0.0.1', expectedSuccess := TRUE, expectedByte1 := BYTE#10, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#1)}
        {Test(ipAddress := '255.255.255.255', expectedSuccess := TRUE, expectedByte1 := BYTE#255, expectedByte2 := BYTE#255, expectedByte3 := BYTE#255, expectedByte4 := BYTE#255)}
        {Test(ipAddress := '0.0.0.0', expectedSuccess := TRUE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        {Test(ipAddress := '256.256.256.256', expectedSuccess := FALSE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        {Test(ipAddress := '192.168.1', expectedSuccess := FALSE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        {Test(ipAddress := '192.168.1.1.1', expectedSuccess := FALSE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        {Test(ipAddress := '192.168.one.1', expectedSuccess := FALSE, expectedByte1 := BYTE#0, expectedByte2 := BYTE#0, expectedByte3 := BYTE#0, expectedByte4 := BYTE#0)}
        METHOD PUBLIC TestParameterizedIpAddress
            VAR_INPUT
                ipAddress : STRING;
                expectedSuccess : BOOL;
                expectedByte1 : BYTE;
                expectedByte2 : BYTE;
                expectedByte3 : BYTE;
                expectedByte4 : BYTE;
            END_VAR
            VAR
                result : BOOL;
                expectedIpv4 : IP_V4;
            END_VAR
            expectedIpv4[1] := expectedByte1;
            expectedIpv4[2] := expectedByte2;
            expectedIpv4[3] := expectedByte3;
            expectedIpv4[4] := expectedByte4;
            
            result := IpHandling.SetIpAddress(ipAddress);
            IsTrue(expectedSuccess = result);
            Equal(actual := IpHandling.GetIpAddress(), expected := expectedIpv4);
        END_METHOD        
    END_CLASS
END_NAMESPACE