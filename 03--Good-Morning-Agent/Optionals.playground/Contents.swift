//: Optional Values

import UIKit

class Party
{
    var time: NSDate = NSDate()
    var location: CGPoint = CGPoint(x: 100, y: 100)
    var guests = [Guest]()
}

class Guest
{
    var beverage: String = "" // Each guest must have a beverage
    var costume: String? = nil // Each guest can choose to come in costume or plain clothes (i.e. costumes optional)
}

let firstGuest = Guest()

firstGuest.beverage = "Beer"
firstGuest.costume = "Spiderman"







