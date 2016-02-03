//: Conditionals


// > Greater Than
// >= Greater Than or Equal To
// < Less Than
// <= Less Than or Equal To
// == IS EQUAL TO
// && = AND
// || = OR


var lowScore: Int = 10
var highScore: Int = 1000

var myScore = 5000

if (myScore > highScore) == true {
    highScore = myScore
}

if (myScore < highScore) == true {
    print("Your score didnt beat our highScore!")
}


if (myScore == lowScore) == true {
    print("You got the low score!")
}



var jacobsAge = 15
var philsAge = 25
var lizziesAge = 18

let minimumAge = 18


if philsAge > minimumAge {
    print("You are of age")
} else {
    print("You are underage")
}

let ageOfAdult = 18

let beerMinimumAge = 21
let beerMaximumAge = 100

if jacobsAge < ageOfAdult {
    print("You are a minor")
}

// OR

if philsAge > ageOfAdult || philsAge > beerMaximumAge {
    print("Your are of age, but you are over \(beerMaximumAge)!")
}

// AND
if philsAge > ageOfAdult && philsAge < beerMaximumAge {
    print("You are of age, and you are younger than \(beerMaximumAge)")
}

// OR
if jacobsAge < ageOfAdult || jacobsAge < beerMinimumAge {
    print("You are a minor OR you are under the \(beerMinimumAge)")
}

// AND
if jacobsAge < ageOfAdult && jacobsAge > beerMinimumAge {
    print("Jacob can buy beer")
}

// AND -- BOTH left and right side must be true
if lizziesAge >= ageOfAdult && lizziesAge < beerMinimumAge {
    
}

// BOTH true

if lizziesAge <= ageOfAdult && jacobsAge <= ageOfAdult {
    
}

// OR
if lizziesAge <= ageOfAdult || jacobsAge <= ageOfAdult {
    
}











