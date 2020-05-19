import Combine

//[1,2,3,4].publisher.map {
//    return $0 * 10
//}.sink { value in
//    print(value)
//}

[1,2,3,4,5].publisher.scan(0) {
    return $0 + $1
}.sink { value in
    print(value)
}
