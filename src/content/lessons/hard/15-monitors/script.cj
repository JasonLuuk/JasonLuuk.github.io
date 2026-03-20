import std.sync.*
import std.time.*

var mon = Monitor()
var flag: Bool = true

main(): Int64 {
    let fut = spawn {
        mon.lock()
        while (flag) {
            println("New thread: before wait")
            mon.wait()
            println("New thread: after wait")
        }
        mon.unlock()
    }

    sleep(10 * Duration.millisecond)

    mon.lock()
    println("Main thread: set flag")
    flag = false
    mon.unlock()

    mon.lock()
    println("Main thread: notify")
    mon.notifyAll()
    mon.unlock()

    fut.get()
    return 0
}

// Output: 
// New thread: before wait
// Main thread: set flag
// Main thread: notify
// New thread: after wait
