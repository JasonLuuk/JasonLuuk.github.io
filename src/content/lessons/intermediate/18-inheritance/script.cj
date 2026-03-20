open class Animal {
    public func sleep() {
        println("zzzzzzzzz")
    }
}

class Dog <: Animal {
    public func bark() {
        println("woof")
    }
}

main() {
    let lucy = Dog()
    lucy.sleep()
    lucy.bark()
}
// Output:
// zzzzzzzzz
// woof
