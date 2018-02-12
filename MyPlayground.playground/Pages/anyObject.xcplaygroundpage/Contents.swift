import UIKit


func aFunc<T>(_ x: T) {
    print(x as! String)
}

//add test
aFunc("String")
//change
var x: AnyObject? = 1 as AnyObject

let result = x as? Int

print(result)

"String".self

let temp = NSNumber(value: 10) as? AnyObject

let resultTemp = temp as? Bool



