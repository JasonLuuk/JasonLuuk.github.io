interface moneyStorage {
    mut func addMoney(): Unit
}

struct Purse <: moneyStorage {
    public var money = 0

    // Without mut, this would return an error
    public mut func addMoney(): Unit {
        money += 1
    }
}

main() {
    var myPurse: Purse = Purse()
    var theirPurse: moneyStorage = myPurse

    theirPurse.addMoney()
    println(myPurse.money)
}

// Output: 
// 0
