/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## Functions
*/

// Remember to expand the console

func isEven(value: Int) -> Bool {
    return value % 2 == 0
}

func isOdd(value: Int) -> Bool {
    return value % 2 == 1
}

isEven(2)
isOdd(2)
isOdd(5)

let arrayOfNumbers = [1,2,3,4,5,6,7,8]

func sum(arrayOfNumbers: [Int]) -> Int {
    var sumTotal = 0
    
    for number in arrayOfNumbers {
        sumTotal = sumTotal + number
    }
    
    return sumTotal
}

sum(arrayOfNumbers)









