# variableSuffix
This is an SPSS Python macro that adds a specific suffix to a set of variables in the dataset. You can apply the suffix to all of the variables, a specific list of variables, or all of the variables except a specific list of variables.

## Usage
**variableSuffix(suffix, include = "ALL", exclude = None)**
* "suffix" is a string that is to be added to the end of any matching variable names.
* "include" is a list of strings identifying the variable names that should have the suffix added to them. If this is excluded, then it defaults to all of the variables in the data set.
* "exclude" is a list of strings identifying the variable names that should not have the suffix added to them. If a variable appears in both the include and exclude lists, it will not have the suffix added to its name.

## Example
**variableSuffix(suffix = "_T1", 
include = "ALL", 
exclude = ["StudentID", "ClassID])**
* This code will add the suffix "_T1" to every variable in the data set except the variables "StudentID" and "ClassID"

This and other SPSS Python Extension functions can be found at http://www.stat-help.com/python.html
