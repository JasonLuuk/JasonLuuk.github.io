main() {
    var a = "initial"
    println(a)
    a = "Cangjie Rocks"
    println(a)

    let f: String = "apple"
    println(f)

    var (b, c): (Int64, Int64) = (1, 2)
    println("${b} ${c}")

    var d = true // boolean type inferred
    println(d)

    var e: Int64
    // println(e)   
    // cannot use uninitialized variable
}

// Output: 
// initial
// Cangjie Rocks
// apple
// 1 2
// true
