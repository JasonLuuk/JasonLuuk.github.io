import std.socket.*
import std.time.*
import std.sync.*

var SERVER_PORT: UInt16 = 31420

func runTCPServer() {
    try (serverSocket = TcpServerSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()
        SERVER_PORT = serverSocket.localAddress.port
        println(SERVER_PORT)

        try (client = serverSocket.accept()) {
            let buf = Array<Byte>(10, item: 0)
            let count = client.read(buf)
            println("Server read ${count} bytes: ${buf}")
        }
    }
}

main() {
    let future = spawn {
        runTCPServer()
    }

    sleep(Duration.millisecond * 500)

    try (socket = TcpSocket("127.0.0.1", SERVER_PORT)) {
        socket.connect()
        socket.write(Array<Byte>([1, 2, 3]))
    }

    future.get()
}

// Output:
// 31420
// Server read 3 bytes: [1, 2, 3, 0, 0, 0, 0, 0, 0, 0]
