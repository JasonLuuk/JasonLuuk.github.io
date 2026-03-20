import std.math.*

let s: String = "constant"

main() {
    println(s)
    // Type definition is not necessary here as it can be inferred
    let n: Int64 = 500000000

    // Statically typed, need to cast int to float for interoperability
    let d = 3e20 / Float64(n)

    println("${n} ${d}")

    // sin does not work with Int
    println(sin(Float64(n)))

}
