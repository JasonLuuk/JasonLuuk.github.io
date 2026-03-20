func sum(nums: Array<Int64>): Int64 {
    var total = 0
    for (i in nums) {
        total += i
    }
    return total
}

main() {
    var sum_even = sum(Array<Int64>(10, {i => 2 * i}))

    var sum_odd: Future<Int64> = spawn {
        sum(Array<Int64>(10, {i => 2 * i + 1}))
    }

    println(sum_even)

    println(sum_odd.get())
}
// Output:
// 90
// 100
