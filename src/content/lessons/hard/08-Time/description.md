# Time

The time package provides time-related types, including date and time, time interval, monotonic time, and time zone, and provides functionality of calculation and comparison.

Parsing time from a string has some requirements, it must contain the current year and date.
If information about the hour, minute and second is not included they all default to 0, the same is true for timezonde which defaults to Local.
You can get a complete table of the letter formatting in cangjie through the docs (API Reference/std Module/std.time Package/time Package).

In the examples shown, we first create a `DateTime` object, then use the `toString` with the given pattern, only to parse that string back into a `DateTime` object.

`DateTime` comparisons are also possible accross timezones, as you can see here, the datetime variable is on the `Shanghai` timezone, and yet it is still equal to the new_york timezone, since the offset between them is 12 hours.

Monotime can also be used to count time, and evaluate program speed as shown.
