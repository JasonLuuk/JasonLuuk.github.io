# Effect Handlers - Resumption

So far, examples we have shown on the previous slide have resumed immediately after handling the effect. However, we do have the option for resuming outside the handler scope. Take into account that handlers of this type are slower, and you should write handlers without resumption argument unless needed.

Effect handlers implementation relies on stack switching and dynamic binding.

`Resumption<A, B>` type saves the state of computation paused by `perform`, and it is passed to `resume` to jump back to the line with `perform` (with switching stacks)
First parameter represents the type of an object passed to `resume` (`resume` with), while the second parameter represent the return type of resumption. For better
understanding you can see the code.

Regarding deferred resumption, in case you just write `resume` in the `handle` block the compiler automatically fills the code, but if you want to `resume` the effect
from outside you need to store the `Resumption` object, like shown in the code. It also can only be assigned to an immutable variable, therefore you can use `Box` to
move the object out from the scope.

`Eff()` is performed at the line 43. The handler increments `cnt`, saves resumption state, and returns "`handle` block. cnt = 1" string that's stored in `val`.


Will jump to and execute lines 43 and 44 and will then jump to handler and return the string "`handle` block. cnt = 2".

The confusion may arise here when we call the handler for the second time. 
As it does not contain `resume` statement you may think it should continue executing 
lines 56 and 58 like before, but that's not true. Let's explain what happens in detail:


First, when we reach `try`-`handle` clause a new stack is created and execution is switched to this stack.
When `Eff()` is performed for the first time and handler finishes, what happens is that we return to the `main` stack and that's why lines 55, 56 and 59 get executed. 
Then, as we `resume` the effect, execution will switch stacks again. After `Eff` is performed at the line 45 and handler finishes, the stack gets switched back to the `main` one, which was stopped at the line 59. So we proceed from here.


For more application of Effect Handlers like dependency injection, custom concurrency, and memoization, visit this
[github link](https://github.com/Huawei-Edinburgh-Programming-Languages/effects-tutorial?tab=readme-ov-file)

You're also encouraged to watch this
[conference video](https://www.youtube.com/watch?v=_pKV0zqoeZQ)
about effect handlers in Cangjie, that also contains deep refactoring example at the end. 
