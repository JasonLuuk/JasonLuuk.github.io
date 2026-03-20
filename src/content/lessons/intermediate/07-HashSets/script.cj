import std.collection.*

var a: HashSet<Int64> = HashSet<Int64>([1, 2, 3])
var b = HashSet<String>(100)
var c = HashSet<Int64>([0, 1, 0])
let d = HashSet<Int64>(c)
let e = HashSet<Int64>(10, {x: Int64 => (x * x)})

main() {
    for (i in c) {
        println("The element is ${i}")
    }

    println(e.size)
    println(e.contains(0))
}

// Output:
// The element is 0
// The element is 1
// 10
// true
