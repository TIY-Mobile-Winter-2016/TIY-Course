//: Review - past two days


// Variables

// Types
// Double
// Float
// String
// Int
// Array
// Dictionary

// let == immutable == value does not change

let constant: Double = 140.34
let minumumScore = 10
let maxScore = 100.33


// var == mutable == values can be changed

var index:Int = 0
var originX: Float = 0.00

index = 5

index = 10

/*------------*/

// Array

var emptyArray: Array<String> = []

let numbersInArray = [1,2,3,4,5,6,7,8,9,10] // immutable
var mutableArray = numbersInArray

// note: we copied the numbersInArray constant to a mutable array (var)


// Dictionary

var userInfo = [String:String]()

userInfo = ["Key":"Value", "Key2":"Value2", "Key3":"Value3"]

userInfo["Key2"] = "NewString"

userInfo


// Tuple

let tipTotal = (1.5, 1.8)

tipTotal.0
tipTotal.1

// mutable - notice named values
var tipPercentages = (low: 15,mid: 18,high: 20)

tipPercentages.low

// for loop -- dictionary

for (key, value) in userInfo {
    print("\(key): \(value)")
}

// for loop - Array

for number in numbersInArray {
    print(number)
}


// while loop

let maximumCount = 50

var count  = maximumCount

while count > 0 {
    count = count - 1
    print("\(count)")
}

count

// while loop

while count < maximumCount {
    count = count + 1
    print("\(count)")
}

count


// functions

func countUp(value: Int) {
    var count = value // copy to variable (remember functions values are "let" or not changeable or immutable
    count = count + 1
}

// creating a mutable (var) value in a function with the "var" keyword
func countDown(var value: Int) {
    
    if value > 0 {
        value = value - 1
    } else {
        value = 0
    }
}


// Class

//class BodyPart {
//    var numberOfParts: Int
//}

// No initialized values in the above class - try again


class BodyPart {
    var numberOfParts: Int
    
    init(parts: Int) {
        self.numberOfParts = parts
    }
}

// init method required

let part = BodyPart(parts: 5)

// Subclass

class Head : BodyPart {
    var numberOfEyes: Int = 2
}

let head = Head(parts: 5)

// notice we called the init method from the BodyPart?


// Subclass

class Arm : BodyPart {
    var numberOfJoints: Int = 10
    
    init(parts: Int, numberOfJoints: Int) {
        super.init(parts: parts)
        
        self.numberOfJoints = numberOfJoints
    }
}

// notice the super.init method called

class Leg : Arm {
    var numberOfLegs: Int
    
    init(parts: Int, joints: Int, legs: Int) {
        self.numberOfLegs = legs
        super.init(parts: parts, numberOfJoints: joints)
    }
}

let leg = Leg(parts: 2, joints: 5, legs: 2)

leg.numberOfParts
leg.numberOfLegs
leg.numberOfJoints










