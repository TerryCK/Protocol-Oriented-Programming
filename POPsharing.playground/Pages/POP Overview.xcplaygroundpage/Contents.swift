
import Foundation

//: [POP Exercises](@next)
/*:
 # Overview
 ## What is POP?
 ### POP : Protocol Oriented Programming
 
 */
 
// OOP: 使用父類別作為樣板，使用繼承使子類無條件擁有父類所有屬性方法，並改寫。
// POP: 使用protocol作為最高樣板，根據不同協議使用`擴展`實作其功能，並且在`struct`/`class`去遵守各項協議使其獲得功能、或方法，優點：遵守協議的物件不會新增不必要的方法與屬性，增加維護與程式碼閱讀性

protocol Animal {
    var name: String { get }
    
}

protocol Flyable {
    
}

protocol Swimable {
    
}

extension Animal {
    var canFly: Bool { return false }
    var canSwim: Bool { return false }
    
}
//: ## if an Object comform protocols with Animal & Flyable, will get this func

extension Animal where Self: Flyable {
    var canFly: Bool { return true }
}
extension Animal where Self: Swimable {
    var canSwim: Bool { return true }
}


struct Parrot: Animal, Flyable{
    let name: String
}

struct Penguin: Animal, Flyable, Swimable {
    let name: String
}

struct Goldfish: Animal, Swimable {
    let name: String
}

let parrot = Parrot(name: "Terry")


parrot.name
parrot.canFly
parrot.canSwim

print(parrot.canFly)










//: [POP Exercises](@next)
// how to using markdown in Playground: https://goo.gl/YaueLv
