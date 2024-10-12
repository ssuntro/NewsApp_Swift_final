//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//TOPIC: difference ways of function declaration
//func aFunction() {}
func findOccurrence(aString: String, substring: String) {}
func add(_ a: Int, with b: Int) {}
func concat(anArray a: [Int], with b: Int) {}

findOccurrence(aString: "Lorem...", substring: "em")
add(8, with: 4)
concat(anArray: [1,2,3], with: 4)




//TOPIC: function shorthand & annonymous function
//no shorthand form of function?
func catSound1(suffix: String, count: Int) -> String { "Meow \(suffix) \(count)" }

//TOPIC.1: traditional annonymous function
let catSound2 = { (suffix: String, count: Int) -> String in
    return "Meow \(suffix)"
}
//let result = catSound2("eiei")
//print(result)

//TOPIC.2: Remove the Return Type and Use Type Inference
let catSound3 = { (suffix: String, count: Int) in
    return "Meow \(suffix)"
}
//TOPIC.3: Remove the Return Keyword
let catSound4 = { (suffix: String, count: Int) in
    "Meow \(suffix)"
}
//TOPIC.4: Use Shorthand Argument Names
let catSound5 = {  "Meow \($0) \($1)" }


//proof: concept function as a variable in swift
let catSound6: (String, Int) -> String = { suffix, count  in
    return "Meow \(suffix) \(count)"
}

//---------
//exercise
var function1: () -> Void = {
    print("Hello, World!")
}

var function2 = function1

function2 = {
    print("Goodbye, World!")
}

function1() // Output: Hello, World!
function2() // Output: Goodbye, World!





let a: (() -> ())












//exercise
let numbers = [3, 1, 4, 1, 5, 9]

// Full closure syntax
let sortedNumbers = numbers.sorted(by: { (a: Int, b: Int) in
    return a < b
})

// Shorthand argument names
let shorthandSortedNumbers = numbers.sorted(by: { $0 < $1 })

print(shorthandSortedNumbers) // Output: [1, 1, 3, 4, 5, 9]
