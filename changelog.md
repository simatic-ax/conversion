# Changelog

## January 2022-01-26

### 0.0.1

- Support also ToInt(value ==> ULINT);
- Remove unused mode "FORCE_LEADING_ZEROS"

## February 2022-02-11
### 0.0.2

- Strings.ToArray(STRING, ARRAY[*] OF CHAR) added

- workaround for stc bug. So the library can be built also for 1500 target
## February 2022-02-18
### 0.0.4
- add Arrays.ToString functionality
## February 2022-02-16
### 0.0.5
- add documentation for Arrays.ToString()

### 0.0.6
- Fix startIdx = 0
- StringToBool(STRING, BOOL) added
- StringToArrayOfLint(STRING, ARRAY[*] OF LINT) added

### 0.0.7
- Overloaded Arrays.ToString(), so that Arrays.ToString(buf, 0, 0); returns a String with length 0;
## March 2022-03-01
### 0.0.8
- StringToBool(STRING, BOOL) added
- StringToArrayOfLint(STRING, ARRAY[*] OF LINT) added
  
## March 2022-06-24
### 0.1.0
- Depends on new System.Math  
