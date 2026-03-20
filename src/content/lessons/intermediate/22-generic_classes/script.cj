class Queue<T> where T <: T {
    let MaxSize = 100
    let values: Array<?T>

    public Queue(var number_of_elements!: Int64 = 0,
                 var start!: Int64 = 0, var end!: Int64 = 0) {
        values = Array<?T>(MaxSize, item: None)
    }

    public func is_empty(): Bool {
        number_of_elements == 0
    }

    public func is_full(): Bool {
        number_of_elements == MaxSize
    }

    public func add(value: T) {
        if (is_full()) {
            throw Exception("Queue is full")
        }
        number_of_elements++
        values[start] = Some(value)
        start = (start + 1) % MaxSize
    }

    public func remove(): T {
        if (is_empty()) {
            throw Exception("Queue is empty")
        }
        number_of_elements--
        let temp = values[end].getOrThrow()
        end = (end + 1) % MaxSize
        temp
    }
}

main() {
    let StringQ = Queue<String>()
    let names = ["Isaac", "Ali", "Dan", "Max", "Sofia"]

    for (str in names) {
        StringQ.add(str)
    }

    while (StringQ.is_empty() == false) {
        print("${StringQ.remove()} ")
    }
    println()

    let IntQueue = Queue<Int64>()
    let numbers = [1, 69, 420, 2137, 3, 7, 17]

    for (number in numbers) {
        IntQueue.add(number)
    }

    while (IntQueue.is_empty() == false) {
        print("${IntQueue.remove()} ")
    }
    println()
}

// Output: 
// Isaac Ali Dan Max Sofia 
// 1 69 420 2137 3 7 17 
