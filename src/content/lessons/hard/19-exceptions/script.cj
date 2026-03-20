open class Father <: Exception {
    var father: Int32 = 0
}

class ChildOne <: Father {
    var childOne: Int32 = 1
}

class ChildTwo <: Father {
    var childTwo: Int32 = 2
}

main(): Int64 {
    try {
        throw IllegalArgumentException("This is an Exception!")
    } catch (e: IllegalArgumentException) {
        println(e.message)
        println("IllegalArgumentException is caught!")
    } catch (e: ChildTwo | ChildOne) {
        println("ChildTwo or ChildOne?")
    } finally {
        println("finally is executed!")
    }

    return 0
}

// Output:
// This is an Exception!
// IllegalArgumentException is caught!
// finally is executed!
