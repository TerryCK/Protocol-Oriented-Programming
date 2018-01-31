
import Foundation

struct MyStruce {
    let str: String?
    let name: String
}

let myStructA = MyStruce(str: nil, name: "X")
let myStructB = MyStruce(str: "hey", name: "exisit")
let myStructs: [MyStruce] = [myStructA, myStructB]


let result1 = myStructs.filter { $0.str != nil }

let result2 = myStructs.flatMap { $0.str }


// Summary: result1 != result2
