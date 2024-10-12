//: [Previous](@previous)

import Foundation
//which of them is value type and ref type?




//struct
//can store property and function
// Can have properties, methods, initializers, and conform to protocols.
struct Person {
    var firstName: String
    var lastName: String
    var age: Int

    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

var person1 = Person(firstName: "John", lastName: "Doe", age: 30)
let person2 = person1 // This creates a copy
person1.firstName = "Anne"


print(person1.fullName()) // Output: John Doe
print(person2.fullName()) // Output: Jane Doe


// tuple
// group multiple values into a single compound value
let unnamedTuple = ("John")
let unnamedTuple1 = ("John", "Doe", 30)
print(unnamedTuple)
print(unnamedTuple1.0) // Output: John

let namedTuple = (firstName: "John", lastName: "Doe", age: 30)
print(namedTuple.firstName) // Output: John

// Function returning a tuple
func getPerson() -> (firstName: String, lastName: String, age: Int) {
    return ("John", "Doe", 30)
}
func getPerson(firstName: String, lastName: String, age: Int) {
    print("completed")
}

print(getPerson(firstName: "", lastName: "", age: 1))
print(getPerson().firstName) // Output: John

typealias NameTuple = (firstName: String, middleName: String?)
var tupleArray: [NameTuple] = []
tupleArray.append( (firstName: "Bob", middleName: nil) )
tupleArray.append( (firstName: "Tom", middleName: "Smith") )


func getCoordinate() -> (Double, Double) {
    return (2.3, 134)
}
let coordinate1 = getCoordinate()
let (lat, long) = getCoordinate()




////class
//// use only when need benefit of pass by reference
//// Can have properties, methods, initializers, inheritance, and conform to protocols.
//// Supports inheritance and deinitializers.
//class Person {
//    var firstName: String
//    var lastName: String
//    var age: Int
//
//    init(firstName: String, lastName: String, age: Int) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//    }
//
//    func fullName() -> String {
//        return "\(firstName) \(lastName)"
//    }
//}
//
//var person1 = Person(firstName: "John", lastName: "Doe", age: 30)
//let person2 = person1 // This references the same instance
//person1.firstName = "Anne"
//
//print(person1.fullName()) // Output: Jane Doe
//print(person2.fullName()) // Output: Jane Doe

