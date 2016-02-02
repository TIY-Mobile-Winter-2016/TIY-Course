//: Functions

var bankAccount = 500.50
var itemAmount = 400.00

func canPurchase(amount: Double) -> Bool {
    if bankAccount >= amount {
        return true
    }
    
    return false
}

func processPurchase(amt: Double) {
    bankAccount -= amt
    print("You made a purchase of the amount \(amt)")
}

if canPurchase(itemAmount) {
    processPurchase(itemAmount)
} else {
    print("Insufficient funds")
}

var name = "Steve Jobs"

func getUpperVersion(inputStr: String) -> String {
    return inputStr.uppercaseString
}

var nameUpper = getUpperVersion(name)


func declareWinner(playerAScore: Int, _ playerBScore: Int) {
    if playerAScore > playerBScore {
        print("Player A Wins!")
    } else if playerBScore > playerAScore {
        print("Player B Wins!")
    } else {
        print("The game is at a standstill!")
    }
}

declareWinner(50, 50)
