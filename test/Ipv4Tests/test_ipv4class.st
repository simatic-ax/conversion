USING Siemens.Simatic.S71500.IPConfiguration;
USING AxUnit.Assert;
USING Simatic.Ax.Conversion;

NAMESPACE Ipv4Tests
    {TestFixture}
    CLASS Test_IpHandlingClass
        VAR
            IpHandling : IpHandling;
        END_VAR
        
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
    END_CLASS
END_NAMESPACE