func vals(): (Int64, Int64) {
    return (3, 7)
}

main() {
    var (a, b) = vals()
    println(a)
    println(b)

    var (_, c) = vals()
    println(c)
}

// Output:
// 3
// 7
// 7
