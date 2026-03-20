import std.time.*

main() {
    let pattern = "yyyy/MM/dd HH:mm:ssSSS OO"
    let datetime = DateTime.of(
        year: 2024,
        month: May,
        dayOfMonth: 22,
        hour: 8,
        minute: 34,
        second: 56,
        nanosecond: 789000000,
        timeZone: TimeZone.load("Asia/Shanghai")
    )
    let str = datetime.toString(pattern)
    println(str)
    println(DateTime.parse(str, pattern))

    let new_york1 = DateTime.of(year: 2024, month: May, dayOfMonth: 21,
        hour: 20, minute: 34, second: 56, nanosecond: 789000000,
        timeZone: TimeZone.load("America/New_york"))

    println(datetime == new_york1)

    let yr = datetime.year
    let dayOfYear = datetime.dayOfYear
    let (isoYear, isoWeek) = datetime.isoWeek

    println("${dayOfYear}th day, ${isoWeek}th week of ${isoYear}")

    let start = MonoTime.now()
    for (_ in 0..200) {
        DateTime.now()
    }
    let end = MonoTime.now()
    let result = end - start
    println("total cost: ${result.toNanoseconds()}ns")
}
