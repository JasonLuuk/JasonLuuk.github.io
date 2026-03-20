let Red = 1

func Green(g: UInt8) {
    return g
}

enum RGBColor {
    | Red
    | Green
    | Blue
    | Red(UInt8)
    | Green(UInt8)
    | Blue(UInt8)
}

enum Expr { // Recursive Enum
    | Num(Int64)
    | Add(Expr, Expr)
    | Sub(Expr, Expr)
}

func evalExpr(c: Expr): Int64 {
    match (c) {
        case Num(n) => return n
        case Add(a, b) => return (evalExpr(a) + evalExpr(b))
        case Sub(a, b) => return (evalExpr(a) - evalExpr(b))
    }
}

main() {
    // Specification needed to disambiguate from the function
    let c: RGBColor = RGBColor.Green
    let cs = match (c) {
        case RGBColor.Red => "Red"
        case Green => "Green"
        case _ => "Not Green or Red"
    }
    println(cs)

    println(evalExpr(Add(Sub(Num(1), Num(2)), Add(Num(3), Num(0)))))

    let r1 = Red // Will choose 'let Red'
    let r2 = RGBColor.Red // Ok: constructed by enum type name

    let g1 = Green(100) // Will choose 'func Green'
    let g2 = RGBColor.Green(100) // Ok: constructed by enum type name

    let b = Blue(100) // Unique Identifier, no issues

}

// Output:
// Green
// 2
