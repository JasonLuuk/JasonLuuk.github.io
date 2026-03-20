# Reading and Writing to Files

In cangjie we use the classes `StringReader` and `StringWriter` to avoid manually manipulating `Byte`s

Here we create `ByteArrayStream()` and use `stringWriter` to write strings directly into the stream. We can then pass this into a file, or print to console.

Reading is a similar process, however the return types can differ. You can see with readln we return an option type because there may not be a line that can be read.

