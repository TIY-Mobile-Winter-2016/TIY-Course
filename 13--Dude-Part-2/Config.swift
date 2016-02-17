//
//  Config.swift
//  missingCar
//
//  Created by Phil Wright on 2/17/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//
​
import UIKit
​
class Config {

    // Make it a Singleton Object
    static let sharedInstance = Config()
    private init() {}

    let defaults = NSUserDefaults.standardUserDefaults()

    // Constant Key Values

    let kRedColorValue = "kRedColorValue"
    let kBlueColorValue = "kBlueColorValue"
    let kGreenColorValue = "kGreenColorValue"
    let kAlphaColorValue = "kAlpha"

    let kLastUsedDate = "kLastUsedDate"
    let kFirstUsedDate = "kFirstUsedDate"

    let kLicensePlate = "kLicensePlate"
    let kName = "kName"
    let kModel = "kModel"
    let kMake = "kMake"
    let kYear = "kYear"

    var redColorValue: Float = 0.5
    var greenColorValue: Float = 0.5
    var blueColorValue: Float = 0.5
    var alphaColorValue: Float = 1.0

    var name: String?
    var make: String?
    var model: String?
    var year: String?
    var licensePlate: String?

    var lastUsedDate: NSDate?
    var firstUsedDate: NSDate?

    func loadConfiguation() {

        self.firstUsedDate = self.defaults.objectForKey(kFirstUsedDate) as? NSDate
        self.lastUsedDate = self.defaults.objectForKey(kLastUsedDate) as? NSDate

        self.name = defaults.stringForKey(kName)
        self.model = defaults.stringForKey(kModel)
        self.make = defaults.stringForKey(kMake)
        self.year = defaults.stringForKey(kYear)
        self.licensePlate = defaults.stringForKey(kLicensePlate)

        self.redColorValue = defaults.floatForKey("RedKey")
        self.greenColorValue = defaults.floatForKey("GreenKey")
        self.blueColorValue = defaults.floatForKey("BlueKey")
        self.alphaColorValue = defaults.floatForKey("AlphaKey")
    }

    func saveConfiguration() {

        let checkFirstDate = self.defaults.objectForKey(kFirstUsedDate) as? NSDate

        if checkFirstDate == nil {
            self.firstUsedDate = NSDate()
            self.defaults.setObject(self.firstUsedDate, forKey: kFirstUsedDate)
        }

        self.defaults.setObject(NSDate(), forKey: kLastUsedDate)

        self.defaults.setValue(self.name, forKey: self.kName)
        self.defaults.setValue(self.make, forKey: self.kMake)
        self.defaults.setValue(self.model, forKey: self.kModel)
        self.defaults.setValue(self.year, forKey: self.kYear)
        self.defaults.setValue(self.licensePlate, forKey: self.kLicensePlate)

        self.defaults.setFloat(self.redColorValue, forKey: kRedColorValue)
        self.defaults.setFloat(self.blueColorValue, forKey: kBlueColorValue)
        self.defaults.setFloat(self.greenColorValue, forKey: kGreenColorValue)
    }
}
