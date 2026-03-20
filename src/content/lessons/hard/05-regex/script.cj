import std.regex.*

main() {
    var a: String = """
        My name is Postman Pat
        my email address is postman.pat@notarealemailaddress.com
        My cat's name is Jess, and her email is dont.contact@mycat.com
    """

    var regex = Regex("[\\S]*@[\\S]*\\.[a-z]+")

    var matcher = Matcher(regex, a)
    let number_of_matches = matcher.allCount()

    for (_ in 0..number_of_matches) {
        var help = matcher.find().getOrThrow().matchStr()
        println(help)
    }
}

// Output: 
// postman.pat@notarealemailaddress.com
// dont.contact@mycat.com
