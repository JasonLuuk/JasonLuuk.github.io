import std.collection.*

main() {
    let s1: String = ""
    let s2 = 'Hello Cangjie Lang'
    let s3 = "\"Hello Cangjie Lang\""
    let s4 = 'Hello Cangjie Lang\n'

    let s5: String = """
        """
    let s6 = '''
        Hello,
        Cangjie Lang'''

    let s7: String = #""#
    let s8 = ##'\n'##
    let s9 = ###"
        Hello,
        Cangjie
        Lang"###

    let r = 2.4
    let sr = r.toString()
    let area: String = "The area of a circle with radius ${r} is ${let PI = 3.141592;PI * r ** 2}"

    println("Initial area string: ${area}")
    println(area.contains("area"))
    println(area.count("i"))
    println(area.replace("${r}", "${r / 2.0}"))
    println(area.startsWith("The"))
    println(area.endsWith("8"))

    let parts: Array<String> = area.split(" ")
    println("Split parts (by space): ${parts}")

    let new_string: String = String.join(parts, delimiter: "-")
    println("Joined string: ${new_string}")

    let spaced_string: String = "  some text with spaces  "
    println("Trimmed string: '${spaced_string.trimLeft(" ")}'")

    println("Lowercase: ${area.toAsciiLower()}")
    println("Uppercase: ${area.toAsciiUpper()}")

    let empty_string: String = ""
    println("Is empty: ${empty_string.isEmpty()}")
    println("Length: ${area.size}")
}
// Output:
// Initial area string: The area of a circle with radius 2.400000 is 18.095570
// true
// 4
// The area of a circle with radius 1.200000 is 18.095570
// true
// false
// Split parts (by space): [The, area, of, a, circle, with, radius, 2.400000, is, 18.095570]
// Joined string: The-area-of-a-circle-with-radius-2.400000-is-18.095570
// Trimmed string: 'some text with spaces  '
// Lowercase: the area of a circle with radius 2.400000 is 18.095570
// Uppercase: THE AREA OF A CIRCLE WITH RADIUS 2.400000 IS 18.095570
// Is empty: true
// Length: 54
