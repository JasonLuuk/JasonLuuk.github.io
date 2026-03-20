class Rectangle {
    let width: Int64
    let height: Int64
    public init(width: Int64) {
        this.width = width
        this.height = width
    }

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    public func area() {
        width * height
    }
}

main() {
    let square: Rectangle = Rectangle(5)
    println(square.area())
}

// Output:
// 25
