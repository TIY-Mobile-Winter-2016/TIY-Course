//: Times

import UIKit

let offsetTime = NSTimeInterval(NSTimeZone.localTimeZone().secondsFromGMT)

var showTimeStr = "05:00 PM" //show time in GMT as String
let formatter = NSDateFormatter()
formatter.dateFormat = "h:mm a"
let showTime = formatter.dateFromString(showTimeStr)
let finalTime = showTime?.dateByAddingTimeInterval(offsetTime) //Add number of hours in seconds, subtract to take away time

if let finalTime = finalTime {
    showTimeStr = formatter.stringFromDate(finalTime)
}
