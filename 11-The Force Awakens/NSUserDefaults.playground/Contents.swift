//: NSUserDefaults

import Foundation

let todayDate = "todayDate"

let defaults = NSUserDefaults.standardUserDefaults()

let today = NSDate()

defaults.setObject(today, forKey: todayDate)
defaults.synchronize()










