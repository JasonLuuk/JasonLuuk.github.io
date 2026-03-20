import stdx.effect.*

class Luka <: Command<String> {}
class Alin <: Command<Unit> {}
class Eff <: Command<Unit> {}

main() {
    // Deferred Resumptions
    let res: Box<?Resumption<String, Unit>> = Box(None)
    try {
        println(0)
        println(perform Luka())
        println(3)
    } handle (_: Luka, next: Resumption<String, Unit>) {
        //                               |      - return type of resumption
        //                               - expected type to resume with

        // res: Resumption<A, B>
        // (resume next with <A>) : B
        println(1)
        res.value = Some(next)
    }

    println(2)
    resume res.value.getOrThrow() with "resumed from outside"
    println(4)

    // Resumption with return type
    let res2: Box<?Resumption<Unit, String>> = Box(None)
    try {
        perform Alin()
        "try block"
    } handle (_: Alin, next: Resumption<Unit, String>) {
        res2.value = Some(next)
        "handle block"
    }

    println(resume res2.value.getOrThrow())

    let res3: Box<?Resumption<Unit, String>> = Box(None)
    let cnt: Box<Int64> = Box(0)
    let val = try {
        perform Eff() // Line 43
        println("returned back to first perform")
        perform Eff() // Line 45
        println("returned back to the secoond perform")
        "try block. cnt = ${cnt.value}"
    } handle (_: Eff, next: Resumption<Unit, String>) {
        cnt.value++
        res3.value = Some(next)
        "handle block. cnt = ${cnt.value}"
    }

    
    println(val) // Line 55
    println(cnt) // Line 56


    println(resume res3.value.getOrThrow()) // Line 59

    
    println(val)
    println(cnt)
}

// Output:
// 0
// 1
// 2
// resumed from outside
// 3
// 4
// try block
// handle block. cnt = 1
// 1
// returned back to first perform
// handle block. cnt = 2
// handle block. cnt = 1
// 2
