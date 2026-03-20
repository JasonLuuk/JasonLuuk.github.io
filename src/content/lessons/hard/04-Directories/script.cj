import std.fs.*

main() {
    var currentDirectory = Directory(Path("./"))

    var subDir: Directory
    if (Directory.exists(Path("./").join("Max_is_amazing")) == false) {
        subDir = currentDirectory.createSubDirectory("Max_is_amazing")
    } else {
        subDir = Directory(Path("./").join("Max_is_amazing"))
    }

    subDir.createFile("Max_Isaac_Ali.txt")

    for (i in currentDirectory.entryList()) {
        println(i.path)
    }

    println()

    var parentDirectory = Directory(Path("../"))
    for (i in parentDirectory.directoryList()) {
        println(i.path)
    }
}
