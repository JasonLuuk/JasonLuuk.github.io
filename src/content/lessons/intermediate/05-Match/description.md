# Match

Match expressions use pattern matching in the following ways:

`|` is used to connect multiple patterns.

The wildcard pattern is defined by a `_`.


Cangjie also supports binding patterns, as demonstrated.
Binding cannot be used with the `|` connection, this throws an error.

For each case branch, the scope level of variables after `=>` is the same as that of variables introduced before `=>`.
This means that we need to be careful not to define variables with already used identifiers, additionally, having the same identifier for different variables in a tuple pattern will raise an error.


Finally, we can also use a type pattern, in this example we see that the object `b` is of class `Brightness` defined earlier.
