
import Combine


//example#1
class TemperatureSensor {
    // PassthroughSubject for Private publisher
    private let temperaturePublisher = PassthroughSubject<Double, Never>()
    
    // AnyPublisher for subscribing objective
    var temperatureUpdates: AnyPublisher<Double, Never> {
        return temperaturePublisher.eraseToAnyPublisher()
    }
    
    func simulateTemperatureChange() {
        let newTemperature = Double.random(in: 0.0...100.0)
        temperaturePublisher.send(newTemperature)
    }
}

let sensor = TemperatureSensor()
let subscriber = sensor.temperatureUpdates.sink { temperature in
    print("Temperature updated: \(temperature) degrees Celsius")
}

sensor.simulateTemperatureChange()
sensor.simulateTemperatureChange()
sensor.simulateTemperatureChange()



//Example#2
// Create 2 publisher streams that emits data
let intPublisher = Just(42)
let stringPublisher = Just("Hello, AnyPublisher!")

func createUnifiedPublisher() -> AnyPublisher<Any, Never> {
    // Combine both publishers into a single AnyPublisher
    return Publishers.Merge(intPublisher.map { $0 }, stringPublisher.map { $0 }).eraseToAnyPublisher()
}

// Subscribe to the unified publisher
let unifiedPublisher = createUnifiedPublisher()

_ = unifiedPublisher.sink { value in
    if let intValue = value as? Int {
        print("Received an integer value: \(intValue)")
    } else if let stringValue = value as? String {
        print("Received a string value: \(stringValue)")
    }
}




///example#3
import Foundation
let myRange = (0...3)
let cancellable = myRange.publisher
    .sink(receiveCompletion: { print ("completion: \($0)") },
          receiveValue: { print ("value: \($0)") })

class APIClient {
    private let session: URLSession
    
    init() {
        session = URLSession.shared
    }
    
    func fetchData<T: Decodable>(_ type: T.Type, from endpoint: URL) -> AnyPublisher<T, Error> {
        return session.dataTaskPublisher(for: endpoint)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher() // Type erase to AnyPublisher
    }
}

let apiClient = APIClient()
let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
//let cancellable = apiClient.fetchData([News].self, from: baseURL)
//    .sink(receiveCompletion: { completion in
//        switch completion {
//        case .finished:
//            print("Request completed successfully.")
//        case .failure(let error):
//            print("Request failed with error: \(error)")
//        }
//    }, receiveValue: { items in
//        print("Received todo items:")
//        todoItems.forEach { print("- \($0.title)") }
//    })


