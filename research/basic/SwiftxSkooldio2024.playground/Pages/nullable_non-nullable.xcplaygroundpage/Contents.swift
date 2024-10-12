//: [Previous](@previous)

import Foundation


//An optional integer type
var a: Int? = nil
a = 20
a?.description
a!.description
if let unwrappedNumber = a {
    print(unwrappedNumber)
} else {
    print("optionalNumber is nil")
}
func printOut() {
    guard let unwrappedNumber = a else {
        print("optionalNumber is nil")
        return
    }
    print(unwrappedNumber)
}
let aa = a ?? 0
let aaa: Data? = nil

a = 20
let result = a.map { $0 * 2 }?.description
let result1 = a.flatMap { Int($0) }
a = nil
let result2 = a.map { $0 * 2 }
let result3 = a.flatMap { Int($0) }








// An implicitly unwrapped optional integer type
var b: Int! = nil
b = 20
b.description
if let unwrappedNumber = b {
    print(unwrappedNumber)
} else {
    print("optionalNumber is nil")
}
func printOut1() {
    guard let unwrappedNumber = b else {
        print("optionalNumber is nil")
        return
    }
    print(unwrappedNumber)
}
let bb = b ?? 0
 
b = 20
let bb1 = b.map { $0 * 2 }
let bb2 = b.flatMap { Int($0) }
b = nil
let bb4 = b.map { $0 * 2 }?.description
let bb5 = b.flatMap { Int($0) }





//if optionalInt != nil { print(optionalInt!) // Output: Hello }
//}
