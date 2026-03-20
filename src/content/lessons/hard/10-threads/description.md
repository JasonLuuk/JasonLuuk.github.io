# Threads

You can easily create threads in Cangjie using `spawn`.


Example function we will be calling.


Suppose we have a function call `f(s)`. Here’s how we’d call that in the usual way, 
running it synchronously.


To invoke this function in a new thread, use `spawn { => f(s) }`.
This new thread will execute concurrently with the calling one.


You can also start a new thread with an anonymous function call inside.


Our two function calls are running asynchronously in separate threads now. 
Wait for them to finish (for a more robust approach, use `get()` on the result of
thread).


When we run this program, we see the output of the blocking call first, 
then the output of the two threads. The threads output may be interleaved,
because goroutines are being run concurrently.
