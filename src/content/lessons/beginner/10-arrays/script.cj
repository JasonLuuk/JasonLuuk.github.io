main() {
    //  Array whose element type is Int64
    var a: Array<Int64> = [1, 3, 2, 4]
    // Array whose element type is String
    var b: Array<String> = ["Hello", "World"]

    let c = Array<Int64>(3, item: 0)
    for (x in c) {
        print("${x} ")
    }
    print('\n')

    let d = Array<Int64>(3, {i => 2 * i + 1})
    for (x in d) {
        print("${x} ")
    }
    print('\n')

    println("d has ${d.size} elements")

    let e = d[1..3]
    for (x in e) {
        print("${x} ")
    }
    print('\n')

    let vA: VArray<Int64, $3> = [4, 5, 1]
}
// Output:
// 0 0 0 
// 1 3 5 
// d has 3 elements
// 3 5 
