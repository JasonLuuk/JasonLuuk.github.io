func sort<T>(nums: Array<T>) where T <: Comparable<T> {
    for (i in 0..nums.size) {
        for (j in i + 1..nums.size) {
            if (nums[j] < nums[i]) {
                // This performs swap of two values:
                (nums[j], nums[i]) = (nums[i], nums[j])
            }
        }
    }
}

main() {
    var A = Array<Int64>([1, 2, 4, 1010, 69, 6, 69, 6, 6, 6, 345, 135, 4325,
                          243, 5432, 5423, 5, 4235, 4235])
    sort(A)
    for (i in A) {
        print("${i} ")
    }
    println()

    var B = Array<String>(["Hello", "my", "name", "is", "Gandalf!"])
    sort(B)
    for (i in B) {
        print("${i} ")
    }
    println()
}

// Output: 
// 1 2 4 5 6 6 6 6 69 69 135 243 345 1010 4235 4235 4325 5423 5432 
// Gandalf! Hello is my name 
