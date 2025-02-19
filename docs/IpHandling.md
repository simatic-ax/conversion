# IpHandling Class Documentation

## Overview
The `IpHandling` class is designed for handling IP address operations, including setting and validating IP addresses, extracting port numbers, and checking if the connection is secure (HTTPS).

## Public Methods

### `SetIpAddress`
Sets the IP address and validates it.
- **Parameters:**
  - `ipAddress` (STRING): The IP address to set.
- **Returns:**
  - `BOOL`: TRUE if the IP address is valid, FALSE otherwise.

### `GetIpAddress`
Gets the IPv4 address.
- **Returns:**
  - `IP_V4`: The IPv4 address.

### `SetPort`
Sets the port number.
- **Parameters:**
  - `portNumber` (UINT): The port number to set.
- **Returns:**
  - `BOOL`: TRUE if the port number is valid, FALSE otherwise.

### `GetPort`
Gets the port number.
- **Returns:**
  - `UINT`: The port number.

### `IsSecure`
Checks if the connection is secure (HTTPS).
- **Returns:**
  - `BOOL`: TRUE if the connection is secure, FALSE otherwise.

## Example Usage

```st
PROGRAM Main
    VAR
        ipHandler : Simatic.Ax.Conversion.IpHandling;
        isValid : BOOL;
        ipAddress : STRING := 'https://192.168.1.1:8080';
        port : UINT;
        isSecure : BOOL;
        ipv4 : IP_V4;
    END_VAR

    // Set the IP address
    isValid := ipHandler.SetIpAddress(ipAddress := ipAddress);
    
    IF isValid THEN
        // Get the IPv4 address
        ipv4 := ipHandler.GetIpAddress();
        
        // Get the port number
        port := ipHandler.GetPort();
        
        // Check if the connection is secure
        isSecure := ipHandler.IsSecure();
    END_IF;
END_PROGRAM
```

## How It Works
1. **Setting the IP Address:** The `SetIpAddress` method sets and validates the IP address. It uses private methods to clean the IP address, convert it to an IPv4 address, and extract the port number.
2. **Getting the IP Address:** The `GetIpAddress` method returns the stored IPv4 address.
3. **Setting the Port:** The `SetPort` method sets the port number.
4. **Getting the Port:** The `GetPort` method returns the stored port number.
5. **Checking Security:** The `IsSecure` method checks if the connection is secure by determining if the IP address uses the HTTPS protocol.

