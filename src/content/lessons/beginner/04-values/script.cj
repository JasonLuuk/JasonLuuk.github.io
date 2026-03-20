main() {
    println("cang" + "jie") // cangjie

    println('1 + 1 = ${1 + 1}') // 2
    println('7.0 / 3.0 = ${7.0 / 3.0}') // 3.50000

    var bit64: Int64 = 3
    var bit32: Int32 = 2
    var bit16: Int16 = 1
    println("${bit64} ${bit32} ${bit16}")

    // Similarly for unsigned integers
    var uBit64: UInt64 = 6
    var uBit32: UInt32 = 5
    var uBit16: UInt16 = 4
    println("${uBit64} ${uBit32} ${uBit16}")

    // Floats
    var fBit64: Float64 = 9.0
    var fBit32: Float32 = 8.0
    var fBit16: Float16 = 7.0
    println("${fBit64} ${fBit32} ${fBit16}")

    println(true && false)
    println(true || false)
    println(!true)
}

// Output: 
// 1 + 1 = 2
// 7.0 / 3.0 = 2.333333
// 3 2 1
// 6 5 4
// 9.000000 8.000000 7.000000
// false
// true
// false
