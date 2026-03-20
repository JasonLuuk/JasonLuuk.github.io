func fact(n: Int64): Int64 {
    if (n == 0) {
        return 1
    }
    return n * fact(n - 1)
}

main() {
    println(fact(7))

    func fibonacci(n: Int64): Int64 {
        if (n < 2) {
            return n
        }
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
    let fib: (n: Int64) -> Int64 = fibonacci
    println(fib(7))
}

// Output:
// let power_of_2: (Int64)->Int64 = {exp:Int64 =>
//     if(exp == 0)
//     {
//         return 1
//     }
//     return 2*power_of_2(exp-1)
// }
