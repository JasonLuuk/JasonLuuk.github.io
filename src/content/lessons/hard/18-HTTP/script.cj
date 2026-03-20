import net.http.*
import std.time.*
import std.sync.*
import std.log.LogLevel

let server = ServerBuilder().addr("127.0.0.1").port(8080).build()

func startServer(): Unit {
    server.distributor.register("/hello", { httpContext =>
        httpContext.responseBuilder.body("Hello Cangjie!")
    })
    server.logger.level = OFF
    server.serve()
}

func startClient(): Unit {
    let client = ClientBuilder().build()

    let response = client.get("http://127.0.0.1:${server.port}/hello")

    let buffer = Array<Byte>(32, item: 0)

    let length = response.body.read(buffer)
    println(String.fromUtf8(buffer[..length]))
    client.close()
}

main() {
    spawn {
        startServer()
    }
    sleep(Duration.second)
    startClient()
}

// Output:
// Hello Cangjie!
