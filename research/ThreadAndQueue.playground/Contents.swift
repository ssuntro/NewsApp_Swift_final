import UIKit

//example 1
for i in 0..<20 {
    print("Hi")
    DispatchQueue.main.async {
        print("index: \(i)")
    }
    print("done")
    print("----")
}


////example 2
//for i in 0..<10 {
//    Task {
//        print("thread: \(Thread.current)")
//        print("is main thread: \(Thread.isMainThread)")
//        try! await Task.sleep(nanoseconds: 3_000_000_000)
//        print("index: \(i)")
//    }
//}


////example 3
//for i in 0..<10 {
//    Task {
//        print("thread: \(Thread.current)")
//        print("is main thread: \(Thread.isMainThread)")
//        try! await Task.sleep(nanoseconds: 3_000_000_000)
//        print("index: \(i)")
//    }
//    print("Hi")
//}



////example 4
//print("main thread: \(Thread.current)")
//for i in 0..<10 {
//    print("Hi")
//    DispatchQueue.main.async {
//        print("thread: \(Thread.current)")
//        print("index: \(i)")
//    }
//    print("done")
//    print("---")
//}



//example 5
//print("main thread: \(Thread.current)")
//for i in 0..<100 {
//    print("Hi")
//    DispatchQueue.global(qos: .background).async {
//        print("thread: \(Thread.current)")
//        print("index: \(i)")
//    }
//    DispatchQueue.main.async {
//        print("thread: \(Thread.current)")
//        print("index: \(i)")
//    }
//    print("done")
//}

////example 6
//for i in 0..<100 {
//    DispatchQueue.global(qos: .background).async {
//        print("thread: \(Thread.current)")
//        Thread.sleep(forTimeInterval: 3.0)
//        print("index: \(i)")
//    }
//}
