import std.console.*

main() {
    // reads full line
    let s1 = Console.stdIn.readln()
    // takes rune as input
    let s2 = Console.stdIn.readUntil(r" ")

    Console.stdOut.writeln(s1.getOrThrow())
    Console.stdOut.writeln(s2.getOrThrow())
    Console.stdOut.flush()
}
