/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## Strings
*/

let helloWorld = "Hello, World!"

// Type Annotation
let helloGlobe: String = "Hello Globe!!"

var myFirstName = "Phil"
var myLastName = "Wright"

// Adding Strings together is called "Concatenation"

let myFullName = myFirstName + " " + myLastName

print("My full name is \(myFullName)")

// Change the variable myFirstName to Bob

myFirstName = "Bob"

// A string is a collection of Characters in Swift

let firstCharacter: Character = "B"
let middleCharacter: Character = "o"
let lastCharacter: Character = "b"

print("\(firstCharacter)\(middleCharacter)\(lastCharacter)")

// That is a lot of work!

// You can reference the characters inside a String type like this.

let firstChar = helloWorld.characters.first
let lastChar = helloWorld.characters.last

// The length of a string is found with the count property

let strlen = myFullName.characters.count











