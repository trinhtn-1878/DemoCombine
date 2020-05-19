import Combine

let passThroughSubject = PassthroughSubject<String, Never>()
passThroughSubject.send("Hello")

passThroughSubject.sink(receiveValue: { value in
    print(value)
})
passThroughSubject.send("World")
passThroughSubject.send("Hello")


let subject = CurrentValueSubject<String, Never>("Init String")
subject.send("Hello")
subject.send("World")

subject.sink(receiveValue: { value in
    print(value)
})

