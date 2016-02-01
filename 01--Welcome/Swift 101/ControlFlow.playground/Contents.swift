/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## Control Flow
*/


let names = ["Garrett", "Sean", "Mitch", "Bronson","Phil"]

for name in names {
    print("Hello, \(name)!")
}

let numbers = [1,2,3,4,5,6,7,8,9,10,20,30,40,50,55,60,65,70,75,80,85,90,100]

for number in numbers {
    print("\(number)")
}

for number in numbers where number > 50 {
    print("\(number)")
}


