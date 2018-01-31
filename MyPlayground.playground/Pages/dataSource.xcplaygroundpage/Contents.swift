
import Foundation

let dic = ["Terry": "X"]
let result = dic["Terry"]
print(result)



enum Status: String {
    case happy, sunny
}
let status = Status(rawValue: "happy")?.rawValue

let x: Int? = 1
let g: Int? = 10

if let results = x ?? g, let c = x {
    print(results)
}
