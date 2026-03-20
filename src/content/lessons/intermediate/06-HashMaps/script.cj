import std.collection.*

main() {
    let map = HashMap<String, Int64>()
    let map2 = HashMap<String, Int64>([("a", 0), ("b", 1)])

    map.put("one", 1)
    map.put("two", 2)

    println(map)
    println(map2)

    let map3 = map2

    // Also modifies map3:
    map2["a"] = 2
    map2.remove("b")
    println(map3)

    for ((k, v) in map2) {
        println("The key is ${k}, the value is ${v}")
    }

    println("Length of a: ${map.size}")
}

// Output:
// [(one, 1), (two, 2)]
// [(a, 0), (b, 1)]
// [(a, 2)]
// The key is a, the value is 2
// Length of a: 2
