# TCP

Cangjie supports transport protocols, including TCP. For more information see the
[official docs](https://cangjie-lang.cn/en/docs?url=%2F0.53.13%2Fuser_manual%2Fsource_en%2FNet%2Fnet_socket.html)

Set up port for communication.

Function that initializes TCP server.

We use `try` with resources, not to worry about freeing that after use.

We bind the server socket to our IP address.
If the port is already taken, we will be assigned a different one. If its free we will receive the same one we wanted.

We block the socket, awiting for connection.


We read the message.


Run the TCP server asynchronously


Wait for server initialization. 

Initialize socket for sending packets. (`127.0.0.1` is localhost)

We connect to the server.
We send messages to the server.

