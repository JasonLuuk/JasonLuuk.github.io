# Exceptions

In Cangjie, exception types are `class` types, and there are two base exception classes: Error and `Exception`.

Error and its subclasses describe internal system errors and resource exhaustion errors. If an internal error occurs, you are notified to terminate the program safely.
`Exception` and its subclasses describe exceptions caused by logic errors or I/O errors during program running, such as out-of-bounds array access or an attempt to open a 
file that does not exist. Such exceptions need to be captured and processed by the program.



In Cangjie we make use of `try` `catch` blocks.

Custom exceptions can be defined as subclasses of the exception type. Note you can not create custom exceptions of the error type.

Here we create custom exception `Father` which inherits from the `Exception` type.



Finally is excecuted after the `try` `catch` statement. The content of a `finally` block is executed regardless of whether an exception occurs