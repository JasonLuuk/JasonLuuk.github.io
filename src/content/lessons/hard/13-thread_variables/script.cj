import std.sync.*
import std.time.*

main() {
    let a = ThreadLocal<Int64>()
    let thread1 = spawn {
        a.set(123)
        println("Local variable of thread1 is ${a.get().getOrThrow()}")
        sleep(Duration.second)
        println("Local variable of thread1 is ${a.get().getOrThrow()}")
    }

    let thread2 = spawn {
        a.set(290)
        println("Local variable of thread2 is ${a.get().getOrThrow()}")
    }

    thread1.get()
    thread2.get()
}

/* Sample Output:
Local variable of thread1 is 123
Local variable of thread2 is 290
Local variable of thread1 is 123
*/
