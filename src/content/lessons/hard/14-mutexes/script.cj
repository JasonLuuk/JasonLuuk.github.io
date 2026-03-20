import std.sync.*
import std.time.*
import std.collection.*

var count = 0

main() {
    let mtx = ReentrantMutex()
    let list = ArrayList<Future<Unit>>()

    for (_ in 0..1000) {
        let fut = spawn {
            sleep(Duration.millisecond)
            mtx.lock()
            count++
            mtx.unlock()
        }
        list.append(fut)
    }

    for (f in list) {
        f.get()
    }

    println("count = ${count}")

    synchronized(mtx) {
        count++
    }
}
