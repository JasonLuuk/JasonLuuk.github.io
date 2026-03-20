import std.random.*

main() {
    let m: Random = Random()
    // Creates a Random object and sets a seed for obtaining the random object.
    m.seed = 3
    // The object can also be of the Bool type.
    let b: Bool = m.nextBool()
    let c: Int8 = m.nextInt8()
    let d: Float16 = m.nextFloat16()
    print("b=${b},")
    println("c=${c} d=${d}")
    return 0
}

// Output:
// b=true
// c=-25 d=0.728027
