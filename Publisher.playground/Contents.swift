import Combine
import Foundation

let fibonacciPublisher = [0,1,1,2,3,5].publisher

_ = fibonacciPublisher.sink(receiveCompletion: { completion in
    switch completion {
        case .finished:
            print("finished")
        case .failure(let never):
            print(never)
    }
}, receiveValue: { value in
    print(value)
})
