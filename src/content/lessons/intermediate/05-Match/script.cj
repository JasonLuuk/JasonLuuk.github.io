enum RGBColor {
    | Red | Green | Blue
}

open class Brightness {
    var a: Int64
    public init() {
        a = 10
    }
}

main() {
    let score = 90
    // Type can be inferred from code blocks
    // (i.e. `:String` is not mandatory)
    let level: String = match (score) {
        case 0 | 10 | 20 | 30 | 40 | 50 => "D"
        case 60 => "C"
        case 70 | 80 => "B"
        case 90 | 100 => "A"
            // ^ Matched.
        case _ => "Not a valid score"
    }
    println(level)

    let tv = ("Alice", 24)
    let s = match (tv) {
        case ("Bob", age) => "Bob is ${age} years old"
        case ("Alice", age) => "Alice is ${age} years old"
            // ^ Matched, "Alice" is a constant pattern,
            // and 'age' is a variable pattern.
        case (name, 100) => "${name} is 100 years old"
        case (_, _) => "someone"
    }
    println(s)

    //Enum pattern matching
    let c = Blue
    let cs = match (c) {
        case Red | Green => "Red or Green"
        case _ => "Other"
            // ^ Matched.
    }
    println(cs)

    var b = Brightness()
    var r = match (b) {
        case d: Brightness => "b is of class Brightness"
            // ^ Matched
        case _ => "b is not of class Brightness"
    }
    println(r)
}

// Output:
// Alice is 24 years old
// Other
// b is of class Brightness
