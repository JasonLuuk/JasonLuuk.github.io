main() {
    if (7 % 2 == 0) {
        println("7 is even")
    } else {
        println("7 is odd")
    }

    if (8 % 4 == 0) {
        println("8 is divisible by 4")
    }

    if (8 % 2 == 0 || 7 % 2 == 0) {
        println("either 8 of 7 are even")
    }

    let num: Int64 = -11

    if (num < 0) {
        println("${num} is negative")
    } else if (num < 10) {
        println("${num} has 1 digit")
    } else {
        println("${num} has multiple digits")
    }
}

// Output
// 7 is odd
// 8 is divisible by 4
// either 8 of 7 are even
// -11 is negative
