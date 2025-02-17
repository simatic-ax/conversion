USING Siemens.Simatic.S71500.IPConfiguration;
USING System.Strings;
NAMESPACE Simatic.Ax.Conversion
    (* 
     * Converts a given input to an IPv4 address.
     *
     * VAR_INPUT
     * ipAddress : STRING - The input value to be converted.
     * VAR_OUTPUT
     * ipV4 : IP_V4 - The resulting IPv4 address after conversion.
     * RETURN: BOOL - Returns TRUE if the conversion is successful, otherwise FALSE.
    *)
    FUNCTION ToIpV4 : BOOL  // Change return type to BOOL
        VAR_INPUT  
            ipAddress : STRING;  // Input IP address as a string
        END_VAR  
        VAR  
            ipParts : ARRAY[1..4] OF DINT;  // Array to hold the four parts of the IP address
            dotPos : INT;  // Position of the current dot in the string
            prevDotPos : INT;  // Position of the previous dot in the string
            i : INT;  // Loop counter
            part : STRING;  // Current part of the IP address being processed
            restString : STRING;  // Remaining part of the IP address string
            partLength : INT;  // Length of the current part
        END_VAR  
        VAR_OUTPUT
            ipV4 : IP_V4;  // Output IP_V4 address
        END_VAR
          
        // Initialization  
        prevDotPos := 1;  
        i := 1;  
        restString := ipAddress;
        ToIpV4 := TRUE;  // Initialize as TRUE
        // Split the IP address into its components  
        REPEAT  
            dotPos := PositionOf(restString, '.');  // Find the position of the next dot
            IF dotPos = 0 THEN  
                dotPos := LengthOf(restString) + 1; // If no more dots, set to end of string
            END_IF;
            partLength := dotPos - 1; // Calculate the length of the current part
            part := Substring(restString, 1, partLength);  // Extract the current part
            IF NOT Strings.ToInt(part, ipParts[i]) OR ipParts[i] < 0 OR ipParts[i] > 255 THEN
                ipParts[i] := 0;
                ToIpV4 := FALSE;  // Set to FALSE if conversion fails
            END_IF;
            restString := Substring(restString, dotPos + 1, LengthOf(restString) - dotPos); // Update the remaining string
            i := i + 1;  
        UNTIL LengthOf(restString) = 0
        END_REPEAT;  
          
        // Check if exactly 4 parts were found
        IF i <> 5 THEN
            ToIpV4 := FALSE;
        END_IF;
        
        // Convert the parts to bytes and store in the IP_V4 array  
        IF ToIpV4 THEN
            FOR i := 1 TO 4 DO  
                ipV4[i] := TO_BYTE(ipParts[i]);  
            END_FOR;
        END_IF;
        
    END_FUNCTION  
END_NAMESPACE