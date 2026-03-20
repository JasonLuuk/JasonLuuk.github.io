# Strings and Runes

Strings in Cangjie are arrays of UInt8 underneath. Runes can represent any character in Unicode set and are converted from `UInt8`.

Type inference from string literal.

String has a instance variable size, which is equal to number of Runes in the string.


We can access individual indexes of the string using `[]` notation. Indexing is from 0.



We can also do extended loop over elements of string, where `i` becomes the value at each Index. 




`Rune` literals are preceded with an `r`, and enclosed with single quatation marks.
