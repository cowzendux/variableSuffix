* Encoding: UTF-8.
* variableSuffix function
* by Jamie DeCoster

* This function adds a specific suffix to a set of variables in the dataset. 
* You can apply the suffix to all of the variables, a specific list of variables,
* or all of the variables except a specific list of variables.

**** Usage: variableSuffix(suffix, include = "ALL", exclude = None)
**** "suffix" is a string that is to be added to the end of any matching variable names.
**** "include" is a list of strings identifying the variable names that should have the 
* suffix added to them. If this is excluded, then it defaults to all of the variables in 
* the data set.
**** "exclude" is a list of strings identifying the variable names that should not have
* the suffix added to them. If a variable appears in both the include and exclude lists,
* it will not have the suffix added to its name.

**** Example: variableSuffix(suffix = "_T1", 
*    include = "ALL", 
*    exclude = ["StudentID", "ClassID])
**** This code will add the suffix "_T1" to every variable in the data set except the variables
* "StudentID" and "ClassID"
.

begin program python.
import spss

def variableSuffix(suffix, include = "ALL", exclude = None):
    # Determine starting list
    if (include == "ALL"):
        startList = []
        for varnum in range(spss.GetVariableCount()):
            startList.append(spss.GetVariableName(varnum))
    else:
        startList = include 

    upperList = [t.upper() for t in startList]
        
    # Remove excluded variables
    if (exclude != None):
        exclude = [t.upper() for t in exclude]
        keepList = list(set(upperList) - set(exclude))

    # Only retain items in startList that are in keepList
    # This extra step allows us to keep variables in their original case instead
    # of converting everything to uppercase
    finalList = []
    for var in startList:
        if (var.upper() in keepList):
            finalList.append(var)

    # Add suffix to all variables remaining in list
    submitstring = "rename variables"
    for var in finalList:
        submitstring += "\n({0} = {0}{1})".format(var, suffix)
    submitstring += "."
    spss.Submit(submitstring)
end program python.

