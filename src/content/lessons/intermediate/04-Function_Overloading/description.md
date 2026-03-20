# Function Overloading

Cangjie supports function overloading in multiple scenarios. 


Overloaded functions have the same name but differ in the number or type of parameters. 
`This` is also true for Variable-Length parameters in a function call. 


In Cangjie, when the last non-named parameter in a function definition is of array type, a sequence of parameters can be directly passed to the position of the corresponding argument to replace the `Array` literal.


A function in a higher-level scope is preferred. 

In functions with nested expressions or functions, the inner scopes are of higher level.