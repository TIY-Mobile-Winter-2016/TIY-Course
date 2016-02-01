/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## Dictionary
*/

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

if numberOfLegs.isEmpty {
    print("It is empty")
} else {
    print("Not Empty")
}

numberOfLegs.count

numberOfLegs["spider"]

for key in numberOfLegs.keys {
    print("\(key)")
}

for value in numberOfLegs.values {
    print("\(value)")
}

for value in numberOfLegs.values {
    print("\(value)")
}

