# Options

`Option` type is basically a box that either contains a value or is empty. It allows for performing computations which may fail.

In this case, function tail expects an array and return its last element. However `if` the array is empty, then there is nothing to be returned. Thats why we need an option.

`None` means that the option is empty.

`Some`, means that the option contains that value


`Option<T>` is equivalent to `?T`, for shorter syntax.

Here we can see `if`-`let` expression that uses pattern matching to unbox an option.


Here we show how tail behaves upon failure.


We also made the `tail` function generic, however, `None` is the same no matter the type inside.
