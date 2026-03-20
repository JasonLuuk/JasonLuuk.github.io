# Sorting

There are two types of sorting in cangjie, Stable sort and Unstable sort. Stable sort ensures that the sequence or equal elements remain the same before and aftersorting. This is not the case for unstable sort.

Calls sorting in ascending order by default, only works on types T that implement the `comparable<T>` interface

Alternatively, you can pass through your own comparison operator, returning 
- `Ordering.LT` if left-hand side is less than the right-hand side in ordering
- `Ordering.RT` if left-hand side is greater than left-hand side in ordering
- `Ordering.EQ` if both are equal.

The passed comparison operator, sorts the list in descending order
