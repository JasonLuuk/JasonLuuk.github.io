import std.collection.*

func map(function: (Int64) -> Int64, arr: Array<Int64>): Unit {
    for (i in 0..arr.size) {
        arr[i] = function(arr[i])
    }
}

func filter<T>(function: (T) -> Bool, arr: Array<T>): ArrayList<T> {
    var ans = ArrayList<T>()
    for (i in 0..arr.size) {
        if (function(arr[i])) {
            ans.append(arr[i])
        }
    }
    return ans
}

main() {
    var nums = Array<Int64>([1, 5, 2, 40, 123, 34])

    var f: (Int64) -> Int64 = {
        x: Int64 => if (x % 2 == 0) {
            x / 2
        } else {
            3 * x + 1
        }
    }

    map(f, nums)

    for (i in nums) {
        print("${i} ")
    }
    println()

    var Filtered = filter({x: Int64 => x >= 20}, nums)

    for (i in Filtered) {
        print("${i} ")
    }
    println()

    var strings = Array<String>(["Ali", "Maks", "Isaac", "Wiktoria", "Mateo"])

    var FilteredStrings = filter({x: String => x > "Lovely"}, strings)

    for (i in FilteredStrings) {
        println(i)
    }

    let f1 = {
        x: Int64 => x * 2
    }

    let f2 = {
        x: Int64 => x + 3
    }

    let arr1 = Array<Int64>([1, 69, 420, 2137])
    let arr2 = Array<Int64>([1, 69, 420, 2137])

    map(f1 ~> f2, arr1)
    map(f2 ~> f1, arr2)

    for (i in arr1) {
        print("${i} ")
    }
    println()
    for (i in arr2) {
        print("${i} ")
    }
    println()
}

// OUTPUT:
// 4 16 1 20 370 17 
// 20 370 
// Maks
// Wiktoria
// Mateo
// 5 141 843 4277 
// 8 144 846 4280
