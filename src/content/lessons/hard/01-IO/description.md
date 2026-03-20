# Console IO

Input and output from the console is done through `std.console`.

These function calls return an option type because the console
may be unable to read any data if it is redirected to an empty file. We can use
`getOrThrow` to access the contents.
Using `Console.stdOut.write()` ensures thread safety.
