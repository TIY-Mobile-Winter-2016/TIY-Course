//: # Working with Dates
//
// https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369


import UIKit

let strDate = "2015-11-01T00:00:00Z" // "2015-10-06T15:42:34Z"

let dateFormatter = NSDateFormatter()

dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

let date: NSDate? = dateFormatter.dateFromString(strDate)

print(date)



