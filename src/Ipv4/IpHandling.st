USING Siemens.Simatic.S71500.IPConfiguration;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    CLASS IpHandling
        VAR
            _ipAddress : STRING;
            _port : UINT;
            _isSecure : BOOL;
            _ipv4 : IP_V4;
            _isValid : BOOL;
        END_VAR

        METHOD PUBLIC SetIpAddress : BOOL
            VAR_INPUT
                ipAddress : STRING;
            END_VAR
            _isValid := THIS._ToIpV4(ipAddress := ipAddress, ipV4 => _ipv4);
            IF (_isValid) THEN
                this._GetPort(ipAddress := ipAddress, Port => _port);
            END_IF;
            SetIpAddress := _isValid;
        END_METHOD

        METHOD PRIVATE _ToIpV4 : BOOL
            VAR_INPUT  
                ipAddress : STRING;  
            END_VAR  
            VAR  
                cleanedIpAddress : STRING;  
            END_VAR  
            VAR_OUTPUT
                ipV4 : IP_V4;  
            END_VAR
            
            cleanedIpAddress := this._CleanIpAddress(ipAddress);
            _ToIpV4 := THIS._ConvertToIpV4(cleanedIpAddress, ipV4);
        END_METHOD  
        
        METHOD PRIVATE _CleanIpAddress : STRING
            VAR_INPUT
                ipAddress : STRING;  
            END_VAR
            VAR
                cleanedIpAddress : STRING;  
                protocolEndPos : INT;  
                portPos : INT;  
            END_VAR
            
            IF PositionOf(ipAddress, 'http://') = 1 THEN
                protocolEndPos := 8;
            ELSIF PositionOf(ipAddress, 'https://') = 1 THEN
                protocolEndPos := 9;
            ELSE
                protocolEndPos := 1;
            END_IF;
            cleanedIpAddress := Substring(ipAddress, protocolEndPos, LengthOf(ipAddress) - protocolEndPos + 1);
            
            portPos := PositionOf(cleanedIpAddress, ':');
            IF portPos > 0 THEN
                cleanedIpAddress := Substring(cleanedIpAddress, 1, portPos - 1);
            END_IF;
            
            _CleanIpAddress := cleanedIpAddress;
        END_METHOD
        
        METHOD PRIVATE _ConvertToIpV4 : BOOL
            VAR_INPUT
                ipAddress : STRING;  
            END_VAR
            VAR
                ipParts : ARRAY[1..4] OF DINT;  
                dotPos : INT;  
                prevDotPos : INT;  
                i : INT;  
                part : STRING;  
                restString : STRING;  
                partLength : INT;  
                isValid : BOOL;  
            END_VAR
            VAR_OUTPUT
                ipV4 : IP_V4;  
            END_VAR
            
            prevDotPos := 1;  
            i := 1;  
            restString := ipAddress;
            isValid := TRUE;  
            
            REPEAT  
                dotPos := PositionOf(restString, '.');  
                IF dotPos = 0 THEN  
                    dotPos := LengthOf(restString) + 1; 
                END_IF;
                partLength := dotPos - 1; 
                part := Substring(restString, 1, partLength);  
                IF NOT Strings.ToInt(part, ipParts[i]) OR ipParts[i] < 0 OR ipParts[i] > 255 THEN
                    ipParts[i] := 0;
                    isValid := FALSE;  
                END_IF;
                restString := Substring(restString, dotPos + 1, LengthOf(restString) - dotPos); 
                i := i + 1;  
            UNTIL LengthOf(restString) = 0
            END_REPEAT;  
              
            IF i <> 5 THEN
                isValid := FALSE;
            END_IF;
            
            IF isValid THEN
                FOR i := 1 TO 4 DO  
                    ipV4[i] := TO_BYTE(ipParts[i]);  
                END_FOR;
            END_IF;
            
            _ConvertToIpV4 := isValid;
        END_METHOD
        
        METHOD PRIVATE _GetPort : BOOL
            VAR_INPUT
            ipAddress : STRING;
            END_VAR
            VAR_OUTPUT
            port : UINT;
            END_VAR
            
            VAR
            portPos : INT;
            portStr : STRING;
            portInt : UINT;
            END_VAR
            
            portPos := PositionOf(ipAddress, ':');
            IF portPos > 0 THEN
            portStr := Substring(ipAddress, portPos + 1, LengthOf(ipAddress) - portPos);
            IF Strings.ToInt(portStr, portInt) AND portInt >= UINT#0 AND portInt <= UINT#65535 THEN
                port := portInt;
                _GetPort := TRUE;
            ELSE
                port := UINT#0;  // Invalid port
                _GetPort := FALSE;
            END_IF;
            ELSE
            port := UINT#0;  // No port found
            _GetPort := FALSE;
            END_IF;
        END_METHOD

        METHOD IsHttp : BOOL
            VAR_INPUT
                ipAddress : STRING;
            END_VAR
            IF PositionOf(ipAddress, 'http://') = 1 THEN
                IsHttp := TRUE;
            ELSE
                IsHttp := FALSE;
            END_IF;
        END_METHOD
        
        METHOD IsHttps : BOOL
            VAR_INPUT
                ipAddress : STRING;
            END_VAR
            IF PositionOf(ipAddress, 'https://') = 1 THEN
                IsHttps := TRUE;
            ELSE
                IsHttps := FALSE;
            END_IF;
        END_METHOD
    

        METHOD PUBLIC GetIpAddress : IP_V4
            GetIpAddress := _ipv4;
            ;
        END_METHOD

        METHOD SetPort : BOOL
            VAR_INPUT
                portNumber : INT;
            END_VAR
            // Implementation to set the port number
            ;
        END_METHOD

        METHOD PUBLIC GetPort : UINT
            GetPort := _port;
            ;
        END_METHOD

        METHOD IsSecure : BOOL
            // Implementation to check if the connection is secure (https)
            ;
        END_METHOD
    END_CLASS

END_NAMESPACE
