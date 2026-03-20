# Path

The `fs` package provides functions to parse and construct file paths in a way that is portable between
operating systems (hopefully); `dir/file` on Linux vs. `dir\file` on Windows, for example.

For more functionality refer to:
[the official documentation](https://cangjie-lang.cn/en/docs?url=%2F0.53.13%2Flibs%2Fsource_en%2Fstd%2Ffs%2Ffs_package_api%2Ffs_package_structs.html%23struct-path).


Join should be used to construct paths in a portable way. First we call the constrcutor, then we chain the `join` calls to construct a hierarchical path from them.


The `Path` struct can operate on any of the following: `//`,`/`,`\`.
For those confused, `..` is a parent directory.

We also have a function that given a `Path`, returns `Option<Path>`, which includes all the directories in hierarchical order.

`fileName`, as name suggests, returns the name of the file at the end of the path.

We can check whether a path is absolute. 


We can extract extension from a `Path` (we extract it from the filename to be exact).
We can also get name without the extension at all.
