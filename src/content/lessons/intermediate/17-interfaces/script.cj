interface Ia {
    func f(): Unit
}

interface Ib {
    func g(): Int64
}

class C <: Ia & Ib {
    public func f(): Unit {
        println("Function F is implemented")
    }
    public func g(): Int64 {
        println("Function G is implemented")
        return 5
    }
}

main() {
    let classInstance: C = C()
    classInstance.f()
    classInstance.g()
}

// Output:
// Function F is implemented
// Function G is implemented
