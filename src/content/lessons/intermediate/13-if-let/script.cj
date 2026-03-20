func check(a: ?Int64) {
    if (let Some(value) <- a) {
        println("Operation successful, return value: ${value}")
    } else {
        println("Operation failed")
    }
}

class Node {
    var child: ?Node = None
    Node(let val: Int64) {}
}

main() {
    let first = Option<Int64>.Some(2023)
    let second = Option<Int64>.None
    check(first)
    check(second)

    let ar = Array<Node>(5, {i => Node(i)})
    for (i in 1..5) {
        ar[i - 1].child = Some(ar[i])
    }
    var cur: Node = ar[0]
    while (let Some(next) <- cur.child) {
        println(next.val)
        cur = next
    }
}

// Output:
// Operation successful, return value: 2023
// Operation failed
// 1
// 2
// 3
// 4
