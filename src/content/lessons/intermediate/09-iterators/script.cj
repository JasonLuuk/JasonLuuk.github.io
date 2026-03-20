class MyArray <: Iterable<Int64> {
    let size = 3
    var arr: Array<Int64>

    public init() {
        arr = Array<Int64>(size, {i: Int64 => i})
    }

    public func iterator(): Iterator<Int64> {
        MyArrayIter(this)
    }
}

class MyArrayIter <: Iterator<Int64> {
    private var idx: Int64
    private let arr_to_iterate: MyArray

    public init(arr: MyArray) {
        idx = 0
        arr_to_iterate = arr
    }

    public func next(): Option<Int64> {
        if (idx < arr_to_iterate.size) {
            idx++
            return Some(arr_to_iterate.arr[idx - 1])
        }
        return None
    }
}

main() {
    let a = MyArray()
    for (i in a) {
        for (p in a) {
            println("${i} ${p}")
        }
    }
}

// Output:
// Numbers in Array: 1 2 3 
// Numbers in ArrayList: 4 5 6 
// Numbers in HashMap: (7,Ali) (8,Isaac) (9,Max) 
// Numbers in HashSet: 10 11 12 
