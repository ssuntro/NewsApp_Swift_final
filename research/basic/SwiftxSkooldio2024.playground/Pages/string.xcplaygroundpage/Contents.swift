//import UIKit
//
////Swift 5.10, was released in March 2024
//

//var name: String
//name = "Bille"
//name = "Allie"
//var a = [""]


////var greeting = "Hello, playground"
//
////Introduction to Strings in Swift
////1. Basic String Declaration
////Strings in Swift are represented by the String type.
//let greeting: String = "Hello, World!"
////2. String Interpolation
////Swift allows embedding variables and expressions inside strings using \(expression).
let name = "Alice"
let message = "Hello, \(name)!"
////3. String Concatenation
////You can concatenate strings using the + operator.
let firstPart = "Hello, "
let secondPart = "World!"
let fullMessage = firstPart + secondPart
////4. Multiline Strings
////Use triple quotes """ for multiline strings.
let multilineString = """
This is a multiline
string in Swift.
"""
////5. String Methods
////Common methods include count, isEmpty, uppercased(), lowercased(), and contains().
let text = "Swift Programming"
print(text.count)          // Output: 17
print(text.isEmpty)        // Output: false
print(text.uppercased())   // Output: SWIFT PROGRAMMING
print(text.contains("Swift")) // Output: true
//
//
////6. String Indexing
////Strings in Swift use String.Index for accessing characters.
///
///
let str = "Hello"
let firstChar = str[str.startIndex] // 'H'
let lastChar = str[str.index(before: str.endIndex)] // 'o'
////7. Substring
////Extracting substrings using ranges.
let start = str.index(str.startIndex, offsetBy: 1)
let end = str.index(str.endIndex, offsetBy: -1)
let substring = str[start..<end] // "ell"
let substring1 = str[..<end]


////8. String Mutability
////Use var for mutable strings and let for immutable strings.
//var mutableString = "Hello"
//mutableString += ", World!" // "Hello, World!"
////9. Unicode and Special Characters and sfsymbol that execusively ava only in apple ecosystem
//let unicodeString = "Café ☕️"
//
////Swift strings are Unicode-compliant and support special characters.
////Example Code
//import Foundation
//
//let greeting = "Hello, World!"
//let name = "Alice"
//let personalizedGreeting = "Hello, \(name)!"
//
//let multilineString = """
//This is a multiline
//string in Swift.
//"""
//
//let text = "Swift Programming"
//print(text.count)          // Output: 17
//print(text.isEmpty)        // Output: false
//print(text.uppercased())   // Output: SWIFT PROGRAMMING
//print(text.contains("Swift")) // Output: true
//

//
//var mutableString = "Hello"
//mutableString += ", World!" // "Hello, World!"
//
//let unicodeString = "Café ☕️"
//
//
//







var a = "Ann"
let b = a
a = "Bumbim"
