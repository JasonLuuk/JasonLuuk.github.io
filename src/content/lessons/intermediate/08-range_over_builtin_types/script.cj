import std.collection.*

main() {
    let A = Array<Int64>([1, 2, 3])
    let B = ArrayList<Int64>([4, 5, 6])
    let C = HashMap<Int64, String>([(7, "Ali"), (8, "Isaac"), (9, "Max")])
    let D = HashSet<Int64>([10, 11, 12])

    print("Numbers in Array: ")
    for (i in A) {
        print("${i} ")
    }
    println()

    print("Numbers in ArrayList: ")
    for (i in B) {
        print("${i} ")
    }
    println()

    print("Numbers in HashMap: ")
    for ((key, val) in C) {
        print("(${key},${val}) ")
    }
    println()

    print("Numbers in HashSet: ")
    for (i in D) {
        print("${i} ")
    }
}

// Output:
// Numbers in Array: 1 2 3 
// Numbers in ArrayList: 4 5 6 
// Numbers in HashMap: (7,Ali) (8,Isaac) (9,Max) 
// Numbers in HashSet: 10 11 12 
