/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## Array
*/

// Fours ways to create a *mutable* array

var firstNames : Array<String> = []
var middleNames = Array<String>()
var lastNames = [String]()
var names = ["Garrett", "Sean", "Mitch", "Bronson", "Phil"]

// how many items in the array? use the count property

names.count

// Check if the array is empty
if names.isEmpty {
    print("Names is Empty")
} else {
    print("Names is not Empty")
}

// Three ways to create a *nonmutable* array

let fNames : Array<String> = ["Clark", "Wright"]
let staticNames = ["Garrett", "Sean", "Mitch", "Bronson", "Phil"]




