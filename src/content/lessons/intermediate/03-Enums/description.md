# Enums

Enums in cangjie are preceded by the `enum` keyword, and define all possible values of the type.

When `match` is used on an `enum`, it must cover all constructors of the `enum` type to be matched.

Identifiers can be shared between `Enum` constructors and other variables/functions/classes, but care must be taken to differentiate between them.

Additionally, constructors within Enums can be overloaded as well, here `Green` and `Green`(`UInt8`) can both be defined since they have a different number of parameters.


`Enum` definitions can be recursive, an example is given here where we use `Expr` to define the constructors within `Expr`.


The examples at the end of the `main` function show common examples for when a specification needs to be made.
