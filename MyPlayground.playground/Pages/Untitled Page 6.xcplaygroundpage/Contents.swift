enum MyEnum: String {
    case myCase
    case Terry = "Terry"
}


var myEnum = MyEnum.Terry

myEnum.rawValue

myEnum = .myCase

myEnum.rawValue

import Foundation

let result: NSNumber? = NSNumber(value: Double.nan)
print(Double.nan)
print("\(result!.doubleValue + 10.0)")

let nsNumbers: [NSNumber] = [T, 20, 30]


let transfer = nsNumbers as? AnyObject
let resultTest = transfer as? Int
print(resultTest)

let boolNSNumber = NSNumber(booleanLiteral: false)
