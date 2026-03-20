import std.collection.*

class C {
    var a: Int64
    var b: Float64

    public init(a: Int64, b: Float64) {
        this.a = a
        this.b = b
    }

    public init(a: Int64) {
        b = 0.0
        this.a = a
    }
}

main() {
    func f(a: Int64): Int64 {
        a
    }

    func f(a: Float64): Float64 {
        a
    }

    func f(a: Int64, b: Float64): Float64 {
        Float64(a) + b
    }

    println(f(1))

    println(f(1.0))

    println(f(1, 1.0))

    let c1 = C(1)
    println(c1.b)

    let c2 = C(2, 3.0)
    println(c2.b)

    func f2(arr: Array<Int64>) {
        "This is the first f2"
    }

    func f2(a: Int64) {
        "This is the second f2"
    }

    println(f2(1, 2))

    println(f2(1))

    func outer() {
        func g(a: Sub) {
            print("1")
        }

        func inner() {
            func g(a: Base) {
                print("2") // 
            }

            g(Sub()) // Output: 2
        }
    }
}

open class Base {}

class Sub <: Base {}

func outer() {
    func g(a: Sub) {
        print("1")
    }

    func inner() {
        func g(a: Base) {
            print("2")
        }

        g(Sub()) // Output: 2
    }
}

// Output:
// 1
// 1.000000
// 2.000000
// 0.000000
// 3.000000
// This is the first f2
// This is the second f2
