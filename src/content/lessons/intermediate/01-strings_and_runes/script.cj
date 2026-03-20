main() {
    let s = "hello"

    println("Len: ${s.size}")

    for (i in 0..s.size) {
        print("${s[i]} ")
    }

    println()

    for (i in s) {
        println("${i}: ${Rune(i)}")
    }

    let c: Rune = r'T'
    println(c)
}

// Output
// Len: 5
// 104 101 108 108 111 
// 104: h
// 101: e
// 108: l
// 108: l
// 111: o
// T
