import UIKit
a()

func a() {
    let x = 8
    callAPIInBgThreadAnyQ()
    print(x)
}

func callAPIInBgThreadAnyQ() {
    let url = URL(string: "https://www.boredapi.com/api/activity")!
    
    print("Before create task")
    let task = URLSession.shared.dataTask(with: url) { _,_,_ in
        print("complete API call")
        print("start API handler")
        print("complete API handler")
    }
    
    print("Before start API call")
    task.resume()
    print("After start API call")
}




///simple await
func callAPIInMainThreadAsyncQ() async {
    print("start API call")
    let url = URL(string: "https://www.boredapi.com/api/activity")!
    let _ = try? await URLSession.shared.data(from: url)
    print("complete API call")
    print("start API handler")
    print("complete API handler")
}

//complex await
let _ = await IntFetcherAwait().task.result // var result: Result<Success, Failure> { get async }

struct IntFetcherAwait {
    let task: Task<Int?, Error> =  {
        return Task { () -> Int? in
            let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
            let (_, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("error explicit casting")
                return nil
            }
            return 10
        }
    }()
}

//how to create get async var
enum NetworkError: Error {
    case badURL
}
var result: Result<Int, NetworkError> { get async {
    return .success(5) }
}


//MARK: implementation assumption of concept behinds dataTask(with: url) and resume
//func dataTask(with url: URL, completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//    ...
//    self.completionHandler = completionHandler
//}
//
//func resume() {
//    DispatchQueue.global(qos: .background).async {
//        repeat {
////            pulling check response arrival
//        } while(...)
//
//        if(...) {
//            completionHandler(Data())
//        } else {
//            completionHandler(nil, nil, Error())
//        }
//    }
//}


