struct Rectangle {
    let width: Int64
    let height: Int64

    static let degree: Int64
    static init() {
        degree = 360
    }

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    public init() {
        this.width = 1
        this.height = 1
    }

    public func area() {
        width * height
    }
}

struct Circle {
    private let name: String

    public Circle(name: String, let radius: Float64) {
        this.name = name
    }

    public func area() {
        this.radius ** 2 * 3.141592653
    }

    public func getName() {
        this.name
    }
}

main() {
    let myRectangle: Rectangle = Rectangle(2, 5)
    // Uses the overloaded constructor:
    let myRectangle2: Rectangle = Rectangle()

    println(myRectangle.area())
    println(myRectangle2.area())

    let myCircle: Circle = Circle("John", 6.0)
    println(myCircle.area())
    println(myCircle.getName())
}

// Output: 
// 10
// 1
// 113.097336
// John
