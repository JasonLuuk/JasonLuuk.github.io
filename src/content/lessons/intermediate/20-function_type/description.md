# Function types

Functions have a type in Cangjie. Therefore we can create variables with function type and pass them to the functions.

Function type is created like this: `f:(T1,T2,T3,T4) -> T5`
Where `T1`,`T2`,...`T5` are some types. It means that function `f` takes in 4 arguments of the corresponding types and return one value of type `T5`.

Map takes in one function and array of numbers. It then proceeds to apply this function to every number in the array. function type is (`Int64`)->`Int64`, so we pass single value of the array, and assign it the return value of the function.


Filter takes in one function and array of numbers. Type of the function is `(T)->Bool`, where T is type variable. It means that given `value:T`, it determines whether to keep it in the new `ArrayList`, or not based on the `Bool` return value.



We can declare variables that are of function type. The type of `f` is `(Int64)->Int64`, so it takes in one int and returns another integer.


We can map this function over the array nums.


We can also create the function in the function call using lambdas.


Because filter is a generic function, it can also work on strings.


Function types can be infered by a compiler from the function definition.










Here we use function composition that is a part of cangjie. 
Lets assume that we have a functions A:(T1)->T2, B: (T2)->T3.
Instead of doing {x:T1 => B(A(x))}, we can do A~>B. 
This creates composed function. REMEMBER ORDER MATTERS!
