//: Car - Classes

import UIKit

enum Transmission: String {
    case Automatic = "automatic"
    case Manual = "manual"
}

enum Color: String {
    case Red = "red"
    case Green = "green"
    case Blue = "blue"
}

class Car {
    
    var numberOfDoors: Int
    var transmissionType: Transmission
    var isSalvaged: Bool
    var color: Color
    var titleNumber: String
    
    init() {
        
        // Default Values
        self.isSalvaged = false
        self.transmissionType = Transmission.Automatic
        self.isSalvaged = false
        self.numberOfDoors = 0
        self.color = Color.Red
        self.titleNumber = ""
    }
    
    func salvageCar() {
        self.isSalvaged = true
    }
}

class Sedan : Car {
    override init() {
        super.init()
        self.numberOfDoors = 4
    }
}

class Truck : Car {
    override init() {
        super.init()
        self.numberOfDoors = 2
        self.color = Color.Blue
    }
}

var nissanSentra = Sedan()
nissanSentra.titleNumber = "A1234235325"


var chevySilverado = Truck()
chevySilverado.titleNumber = "B1232132132"

nissanSentra.numberOfDoors
nissanSentra.color
nissanSentra.isSalvaged

nissanSentra.salvageCar()

nissanSentra.isSalvaged

chevySilverado.isSalvaged
chevySilverado.color = Color.Red

chevySilverado.transmissionType = Transmission.Manual

chevySilverado.transmissionType

















