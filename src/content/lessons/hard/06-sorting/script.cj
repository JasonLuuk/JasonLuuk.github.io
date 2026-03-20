import std.sort.*
import std.random.*

main() {
    let r: Random = Random()
    r.seed = 68
    let arr: Array<UInt16> = Array<UInt16>(15, {_ => r.nextUInt16()})
    arr.sort(stable: true)

    let arr2: Array<UInt16> = Array<UInt16>(15, {_ => r.nextUInt16()})
    arr2.sortBy(stable: true) {
        rht: UInt16, lht: UInt16 =>
            if (rht > lht) {
                return Ordering.LT
            }
            if (rht < lht) {
                return Ordering.GT
            }
            return Ordering.EQ
    }

    for (x in arr) {
        print("${x} ")
    }
    println()
    for (x in arr2) {
        print("${x} ")
    }
    println()
}

// Output:
// 3688 6434 10649 11621 14049 15694 17998 20519 27180 42047 50464 54444 58147 59107 59339 
// 58236 55494 46404 44746 38773 35561 32075 28573 26590 26179 22632 12469 9450 2124 1656 
