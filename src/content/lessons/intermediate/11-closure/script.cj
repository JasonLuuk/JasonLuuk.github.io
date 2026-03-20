func adding(): (Int64) -> Int64 {
    let num = 10
    func numPlus(a: Int64): Int64 {
        num + a
    }
    numPlus
}

main() {
    var nextInt: (Int64) -> Int64 = adding()
    println(nextInt(12))
}

// Output
// 22
