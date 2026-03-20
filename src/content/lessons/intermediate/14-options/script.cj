func tail<T>(arr: Array<T>): Option<T> {
    if (arr.size == 0) {
        return None
    }
    return Some(arr[arr.size - 1])
}

main() {
    var a: ?Int64 = tail([5, 3, 69, 11])

    if (let Some(value) <- a) {
        println(value)
    } else {
        println("Empty List")
    }

    a = tail([])
    if (let Some(value) <- a) {
        println(value)
    } else {
        println("Empty List")
    }

    var b: ?String = tail(["YMCA"])
    if (let Some(value) <- b) {
        println(value)
    } else {
        println("Empty List")
    }
}

// Output:
// 11
// Empty List
// YMCA
