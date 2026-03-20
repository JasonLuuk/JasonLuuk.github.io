func sum(arr: Array<Int64>): Int64 {
    println(arr)
    var total: Int64 = 0
    for (i in arr) {
        total += i
    }
    println(total)
    return total
}

main() {
    sum(1, 2)

    sum(1, 2, 3)

    let nums = Array<Int64>([1, 2, 3, 4])
    sum(nums)
}

// [1, 2]
// 3
// [1, 2, 3]
// 6
// [1, 2, 3, 4]
// 10
