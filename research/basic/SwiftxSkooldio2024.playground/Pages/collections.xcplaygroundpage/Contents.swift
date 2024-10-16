//: [Previous](@previous)

import Foundation

//array
let a = [1,2,3,4]
var emptyArray = [Int]()
emptyArray.append(2)
emptyArray[0] = 10 //warning: can be runtime error, out of bound error
print(emptyArray[0]) //warning: can be runtime error, out of bound error

//dictionary
var emptyDictionary = [String: Int]()
emptyDictionary["b"] = 20
print(emptyDictionary["b"] ?? "")
let aDictionary = ["a": 1, "b": 2, "c": 3]

//sets
var emptySet: Set<Int> = []
emptySet.insert(6)
emptySet.insert(6)
print(emptySet.contains(6))
let set: Set<Int> = [1, 2, 3, 4, 5]

//range(exercise)
let closedRange = 1...5
let halfOpenRange = 1..<5
let upToFive = ..<5
let fromFive = 5...
for number in 0...9 {
    print(number) // Output: 0 1 2 3 4 5..9
}


//range with collections
let array = [10, 20, 30, 40, 50]
let slice = array[1...3]
print(slice) // Output: [20, 30, 40]

let string = "Hello, World!"
let startIndex = string.index(string.startIndex, offsetBy: 7)
let endIndex = string.index(string.startIndex, offsetBy: 12)
let substring = string[startIndex...endIndex]
print(substring) // Output: "World"



//collections and iteration
let array1 = [1, 2, 3, 4, 5]
let doubleOfArray1 = array1.map { $0 * 2 }

func square(_ number: Int) -> Int {
    return number * number
}
let squareOfArray1 = array1.map(square)
array1.forEach { element in
    print(element)
} //foreach return nothing


print(array1.filter { $0 % 2 == 0 })
print(array1.reduce(0, +))
let array2 = array1 + [nil, nil]
print(array2.compactMap { Int($0 ?? <#default value#>) })
print(array.flatMap { $0 })
for (index, element) in array1.enumerated() {
    print("Index: \(index), Element: \(element)")
}
for (number, letter) in zip([1, 2, 3], ["a", "b", "c"]) {
    print("\(number): \(letter)")
}




