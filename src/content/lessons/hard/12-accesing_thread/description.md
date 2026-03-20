# Accessing Thread

Newly created threads in Cangjie can terminate early if the thread that created them terminates. However, you can use the return value of a thread to wait until execution is complete.
The return value of a thread is `Future<T>`. You can think of it as a box that promises this value will be computed; you just need to wait.


Normal function call.


The return value of a thread is of type `Future<Int64>`.


Here we use one of the functions on `Future`, `get()`, which waits for a thread to finish execution and produce a value. This way, the `main` thread will not finish before the newly created ones.
