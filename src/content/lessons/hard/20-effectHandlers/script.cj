import stdx.effect.Command

class Example <: Command<Int64> {}
class One <: Command<Unit> {}
class Two <: Command<Unit> {}
class Three <: Command<Unit> {}
class Default <: Command<Unit> {
    public func defaultImpl() {
        println("defaultImpl called")
    }
}

main() {
    // Simple Example With Producing a Value
    try {
        print("one ")
        var foo = perform Example()
        print("three: ${foo} ")
    } handle (_: Example) {
        print("two ")
        resume with 99
    }
    println("four")

    // Nested Effects and Dynamic Binding
    try { 
        // Handled with outer handler
        perform One()

        try {
            // Handled with inner handlers
            perform One()
            perform Two()

            // Handled with outer handler as it's not available here
            perform Three()
        } handle (_: One) {
            println("One inner")
            resume
        } handle (_: Two) {
            println("Two")
            resume
        }

        // After perform Three() is handled from line 50 it is not resumed,
        // which means we will never reach this statement
        println("Unreachable")
    } handle(_: One) {
        println("One")
        resume
    } handle(_: Three) {
        println("Three")
    }

    // Default Handlers
    // It is not handled here so default handlers gets called
    perform Default()
    try {
        // Handler below gets called
        perform Default()
    } handle(_: Default) {
        println("handler executed")
    }

    // The effect neither has a default handler not is handled
    // explicitly, so an exception is thrown
    perform Two()
}

// Output:
// one two three: 99 four
// One
// One inner
// Two
// Three
// defaultImpl called
// handler executed
// An exception has occured:
// Unhandled Command: Unhandled command
