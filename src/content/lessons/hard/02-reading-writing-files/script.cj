import std.fs.*
import std.io.*

main() {
    let byteArrayStream = ByteArrayStream()
    let stringWriter = StringWriter(byteArrayStream)

    stringWriter.write("Hello")
    stringWriter.writeln(", world!")
    stringWriter.writeln("this is being written")
    stringWriter.flush()

    let file = File.create("./tempFile.txt")
    file.write(byteArrayStream.readToEnd())

    let file2 = File.openRead("./tempFile.txt")
    let stringReader = StringReader(file2)
    println(stringReader.readln().getOrThrow())
    println(stringReader.readToEnd())
}

// Output:
// Hello, world!
// this is being written
