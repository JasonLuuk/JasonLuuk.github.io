import std.collection.*

main() {
    // Signature:
    // Range<T>(start: T, end: T, step: Int64,
    //          hasStart: Bool, hasEnd: Bool, isClosed: Bool)

    // r1 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    let r1 = Range<Int64>(0, 10, 1, true, true, true)
    // r2 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r2 = Range<Int64>(0, 10, 1, true, true, false)
    // r3 contains 10, 8, 6, 4, 2
    let r3 = Range<Int64>(10, 0, -2, true, true, false)

    let n = 10
    // re1 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let re1 = 0..10 : 1
    // re2 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    let re2 = 0..=n : 1
    // re3 contains 10, 8, 6, 4, 2
    let re3 = n..0 : -2
    // re4 contains 10, 8, 6, 4, 2, 0
    let re4 = 10..=0 : -2

    let re5 = 10..0 : 1

    var it = re5.iterator()
    while (let Some(i) <- it.next()) {
        println(i)
    }
}
