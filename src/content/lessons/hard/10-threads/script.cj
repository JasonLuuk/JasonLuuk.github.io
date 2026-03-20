import std.time.*
import std.sync.*

func f(from: String) {
    for (i in 0..3) {
        println("${from}:${i}")
        sleep(Duration.millisecond * 100)
    }
}

main() {
    f("direct")

    spawn {=>
        f("Cangjie Thread")
    }

    // Remember that `=>` is omissible here
    // as there are no arguments for the lambda
    spawn {
        {mess: String => println(mess)}("going")
    }

    sleep(Duration.second)
    println("done")
}

/*
direct:0
direct:1
direct:2
Cangjie Thread:0
going
Cangjie Thread:1
Cangjie Thread:2
 */
