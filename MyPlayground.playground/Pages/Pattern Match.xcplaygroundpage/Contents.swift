


let someOptional: Int? = 42
// Match using an enumeration case pattern.
if case .some(let x) = someOptional {
    print(x)
}

// Match using an optional pattern.
if case let x? = someOptional {
    print(x)
}



protocol HightProtocol {}
protocol Push: HightProtocol {}
protocol GoOut: HightProtocol {}


var str = "terry"
let first = str.removeFirst()
str

import Foundation

let array = [Int]()
//array[0]
array.first
let testString = "000.00"
let range = testString.range(of: ".")
let nsRange = NSRange.init()
nsRange.location

print(range!.lowerBound)


//let textDistance = testString.

