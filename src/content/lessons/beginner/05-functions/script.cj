func plus(a: Int64, b: Int64): Int64 {
    a + b
}

// Return type can be inferred:
func plusPlus(a: Int64, b: Int64, c: Int64) {
    a + b + c
}

main() {
    var res = plus(1, 2)
    println("1 + 2 = ${res}")
    res = plusPlus(1, 2, 3)
    println("1 + 2 + 3 = ${res}")
}

// Output:
// 1 + 2 = 3
// 1 + 2 + 3 = 6
