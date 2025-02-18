USING Siemens.Simatic.S71500.IPConfiguration;
USING System.Strings;
NAMESPACE Simatic.Ax.Conversion
    FUNCTION ToIpV4 : BOOL
        VAR_INPUT  
            ipAddress : STRING;  
        END_VAR  
        VAR  
            cleanedIpAddress : STRING;  
        END_VAR  
        VAR_OUTPUT
            ipV4 : IP_V4;  
        END_VAR
        
        cleanedIpAddress := CleanIpAddress(ipAddress);
        ToIpV4 := ConvertToIpV4(cleanedIpAddress, ipV4);
    END_FUNCTION  
    
    FUNCTION CleanIpAddress : STRING
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
        
        CleanIpAddress := cleanedIpAddress;
    END_FUNCTION
    
    FUNCTION ConvertToIpV4 : BOOL
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
        
        ConvertToIpV4 := isValid;
    END_FUNCTION
    
    FUNCTION IsHttp : BOOL
        VAR_INPUT
            ipAddress : STRING;
        END_VAR
        IF PositionOf(ipAddress, 'http://') = 1 THEN
            IsHttp := TRUE;
        ELSE
            IsHttp := FALSE;
        END_IF;
    END_FUNCTION
    
    FUNCTION IsHttps : BOOL
        VAR_INPUT
            ipAddress : STRING;
        END_VAR
        IF PositionOf(ipAddress, 'https://') = 1 THEN
            IsHttps := TRUE;
        ELSE
            IsHttps := FALSE;
        END_IF;
    END_FUNCTION
    
    FUNCTION GetPort : INT
        VAR_INPUT
            ipAddress : STRING;
        END_VAR
        VAR
            portPos : INT;
            portStr : STRING;
            port : INT;
        END_VAR
        
        portPos := PositionOf(ipAddress, ':');
        IF portPos > 0 THEN
            portStr := Substring(ipAddress, portPos + 1, LengthOf(ipAddress) - portPos);
            IF Strings.ToInt(portStr, port) THEN
                GetPort := port;
            ELSE
                GetPort := -1;  // Invalid port
            END_IF;
        ELSE
            GetPort := -1;  // No port found
        END_IF;
    END_FUNCTION
    
END_NAMESPACE