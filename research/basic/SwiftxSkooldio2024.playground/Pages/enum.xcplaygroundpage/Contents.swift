//: [Previous](@previous)

import Foundation

enum Direction {
    case north, south, east, west
    func distance() -> Double {
        switch self {
        case .north:
            return 22.34
        case .south:
            return 34.2
        case .west:
            return 11
        case .east:
            return 222
        }
    }
}

let a: Direction
a = .north

enum Planet: Int {
    case mercury = 2, venus, earth, mars
}

print(Planet.venus.rawValue)
let targetPlanet = Planet(rawValue: 3)
let notFoundPlanet = Planet(rawValue: 111)

enum AnimalSound: String {
    case human = "Hi"
    case dog = "Woof"
    case cow = "Moo"
    case fox = "DingDing"
}
print(AnimalSound.fox.rawValue)



//TOPIC: associated type
//#1
enum ExtendedColor {
    case red
    case yellow
    case blue
    case gray(brightness: UInt8)
}
//#2
enum NetworkResult {
    case success(data: Data)
    case failure(error: Error)
}
//#3
enum UserAction {
    case login(username: String, password: String)
    case logout
}

let action = UserAction.login(username: "john_doe", password: "12345")
switch action {
case .login(let username, _):
    print("User \(username) is logging in.")
case .logout:
    print("User is logging out.")
}

// custom initiatizers
enum Temperature {
    case celsius(Double)
    case fahrenheit(Double)
    
    init(fromKelvin kelvin: Double) {
        self = .celsius(kelvin - 273.15)
    }
}
let c = Temperature.celsius(222)
let d = Temperature(fromKelvin: 222)

