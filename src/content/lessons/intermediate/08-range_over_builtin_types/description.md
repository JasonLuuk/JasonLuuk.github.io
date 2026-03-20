# Range Over Builtin Types

If a type implements Iterable interface, we can range over it. All data structures in `std.collection`
implement that interface. Therefore we can use for loop to iterate over their elements.


Range over `Array`.


Range over `ArrayList`. You shouldnt modify the size of the `ArrayList` during iteration, because
that invalidates iterators.


We use pattern matching to decompose value into `key` and `value`. Same note as in `ArrayList`, we
should not add elements during iteration.


Same note as in previous examples.
