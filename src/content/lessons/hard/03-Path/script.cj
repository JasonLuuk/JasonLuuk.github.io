import std.fs.*

main() {
    var path = Path("C:").join("Users").join("Isaac").join("options.cj")

    println("p: ${path}")

    println(Path("dir1//").join("filename.txt"))
    println(Path("dir/../dir1").join("filename"))

    println("Dir(p): ${path.directoryName}")

    println("Base(p): ${path.fileName}")

    println(Path("dir/file").isAbsolute())
    println(Path("/dir/file").isAbsolute())

    var file = Path("config.json")

    println(file.extensionName)
    println(file.fileNameWithoutExtension)
}

// Output:
// p: C:/Users/Isaac/options.cj
// dir1//filename.txt
// dir/../dir1/filename
// Dir(p): Some(C:/Users/Isaac)
// Base(p): Some(options.cj)
// false
// true
// Some(json)
// Some(config)
