# Thread Variables

You can use `ThreadLocal` in the core package to create 
and use thread local variables.each thread can safely 
access its own thread local variables without being 
affected by other threads.

`ThreadLocal` variable initialization.
`.get()` returns `Option<T>`.

Set value of variable `a` to 123.
Print that value.
Wait for the second thread to set value of `a`.
Print the same unchanged value.


Change value of a during the time first thread is running.


As we can see, truly, the variable `a` is local to each thread.
