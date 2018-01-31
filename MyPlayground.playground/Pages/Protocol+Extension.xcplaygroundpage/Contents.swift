
import Foundation

protocol MyProtocol: CustomStringConvertible {
    var description: String { get }
}

extension MyProtocol {
    var description: String {
        return "in Extension"
    }
}

struct MyStruct: MyProtocol {
    var description: String {
        return "in MyStruct"
    }
}

struct MyStructB: MyProtocol {
    
}
 
let testStruct = MyStruct()
let usingDefaultStruct = MyStructB()

testStruct.description
usingDefaultStruct.description

let x: Int? = 1
let y  =  x.map { $0 + 1 }
print(y)
let z = x.flatMap { $0 }

let intArray = [1, nil, 5,nil, 10]

let flat = intArray.flatMap { $0 }
let map = intArray.map{ $0 }
flat
map




