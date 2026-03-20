# Class Inheritance


Like most programming languages that support the `class` type, Cangjie supports `class` inheritance. If `class` `B` inherits `class` `A`, `class` `A` is the superclass and `class` `B` is the subclass. The subclass inherits all members  of the superclass except private members and constructors

A `class` can only inherit one `class`. Abstract classes can always be inherited. Therefore, the open modifier is optional when an abstract `class` is defined. You can also use sealed to modify an abstract `class`, indicating that the abstract `class` can be inherited only in the current package. A non-abstract `class` can be inherited only if it is modified by open during definition. 

Subclasses inherit all members of the superclass except private members and constructors.

Superclass constructor can be called using `super()`.
