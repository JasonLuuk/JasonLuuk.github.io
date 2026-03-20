main() {
    var i = 1
    while (i <= 3) {
        print("${i} ")
        i++
    }
    println()

    for (j in 0..3) {
        print("${j} ")
    }
    println()

    for (j in 0..=3) {
        print("${j} ")
    }
    println()
    let words = ["This", "is", "Cangjie"]
    for (word in words) {
        print("${word} ")
    }
    println()

    let array = [(1, 2), (3, 4), (5, 6)]
    for ((x, y) in array) {
        println("${x}, ${y}")
    }

    for (j in 0..8 where j % 2 == 1) {
        print("${j} ")
    }
    println()

    var number = 2
    for (_ in 0..3) {
        number *= number
    }
    println(number)
}

// Output:
// 1 2 3 
// 0 1 2 
// 0 1 2 3 
// This is Cangjie 
// 1, 2
// 3, 4
// 5, 6
// 1 3 5 7 
// 256
