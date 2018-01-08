
import Foundation

/*:
 [POP Exercises](@next)
 # Overview
 ## What is POP?
 ### POP : Protocol Oriented Programming
    1. Interface
    2. Outline of document
    3. Promise
    4. Groups
 #### -           OOP  vs  POP
    1.         Abstraction
    2.         Encapsulation
    3.         Polymorphism
    4.   Inheritance   Composition
 */

/*:
  # Protocol syntax
 ## Definition
 */
protocol MyProtocol {
    // protocol Definition here
}

//: ## Conforms
struct MyStruct : MyProtocol { /* implement here */ }
enum   MyEnum   : MyProtocol { /* implement here */ }
class  MyClass  : MyProtocol { /* implement here */ }


/*:
 ## Protocol Extensions
 ### Introduced @ Swift 2.0 WWDC 2015
 
 ### Implement the protocol as default
 
 ### Extension syntax recap
 
 1. Computer properties
 2. Methods
 3. Initializers
 4. Subscripts
 */
extension MyProtocol { /* implement here */ }

/*:
  ## Composition
 ### multiple protocols conform
 */
protocol AnotherProtocol { }
struct MyAnotherStruct: MyProtocol, AnotherProtocol {}

/*:
 
 ### - Requirements
    1. Abstraction
    2. Property requirements
    3. Method requirements
 #### For Struct, Enum, however in Class the keyword `mutating` can remove
  */
protocol FullName {
//    Property requirements
    var firstName : String { get set }
    var lastName  : String { get set }
    
    var readOnly  : String { get }
    
    static var typeProperty : String  { get }
    
//     Method requirements
    func getFullName() -> String
   
    mutating func changeName(firstName: String, lastName: String)
}


/*:
 ## Implement protocol in class
### Note: don't place keyword `mutating` in class mutating func
 */
class FullNameClass: FullName {
    var firstName : String = "Terry"
    var lastName  : String = "Chen"
    
    var readOnly: String { return "ReadOnly Property" }
    
    static var typeProperty : String  { return "ReadOnly Property" }

    func getFullName() -> String { return "\(firstName), \(lastName)"}
    func changeName(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

//: ### Usage
let instance = FullNameClass()
instance.getFullName()
/*:
  ## Naming style of protocol
 
 ### Suffix: -able, -Protocol, -DataSource, -Delegate

  ## General Protocols:
    1. Collection     :    Dictionary, Array, Set, Squence
    2. BinaryInteger  :    All Integer type, inclouding UInt
    3. Comparable     :    >, <, Inherits from Equatable
    4. Equatable      :    ==, !=
    5. Hashable       :    Inherits from Equatable
    6. Numeric        :    All Number, integers, floating-point
 
  ## Optional requirement
 ### It's only for Classes with `@objc` protocol attribute
 */



/*:
 ## Protocol Extensions
 ### Introduced @ Swift 2.0 WWDC 2015
 
 ### Extension syntax recap
 
    1. Computer properties
    2. Methods
    3. Initializers
    4. Subscripts
 */
extension MyProtocol {
    var computerProperty: String { return "it's a ComputerProperty" }
    func method() -> String      { return "it's a default methods"}
}

//: ### Usage
let myStruct = MyStruct()

myStruct.computerProperty
myStruct.method()

/*:
 ## Protocol inheritance
 */

extension FullName {
    var readOnly: String { return "ReadOnly Property" }
    
    static var typeProperty : String  { return "ReadOnly Property" }
    
    func getFullName() -> String { return "\(firstName), \(lastName)"}
    
    mutating func changeName(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

protocol Person: FullName {
    var age: Int { get set }
}

extension Person {
    var vocation: String { return String(describing: type(of: self)) }
}

struct Student: Person {
    var age: Int
    var firstName: String
    var lastName: String
    // override write
    func getFullName() -> String {
        return "\(firstName), \(lastName)"
    }
    
}

let terry = Student(age: 10, firstName: "Terry", lastName: "Chen")
let vocation = terry.vocation // implement extension
terry.getFullName()

/*:
 ## Protocol as type, and polymorphism
 */


struct Teacher: Person {
    var age: Int
    var firstName: String
    var lastName: String
    
    // new property
    var teaching: String
}
let curry = Teacher(age: 36, firstName: "Steven", lastName: "Curry", teaching: "Math")

var people: [Person] = [terry ,curry]
print("People\n")
people.forEach { print("\($0.firstName) is a \($0.vocation)") }


/*:
 ## Protocol composition
 */

protocol Famous {
    var fans: Double { get }
}
protocol TennisPlayerProtocol {
    var isPlayTennis: Bool { get }
}
extension TennisPlayerProtocol {
     var isPlayTennis: Bool { return true }
}

extension Famous {
    var fans: Double {
        return 512_213_321_135
    }
}

struct TennisPlayer: Person, TennisPlayerProtocol, Famous {
    var age: Int
    
    var firstName: String
    
    var lastName: String
}

let federer = TennisPlayer(age: 36, firstName: "Federer", lastName: "Roger")
people.append(federer)
print("\nAfter people append ferderer\n")
people.forEach { print("\($0.firstName) is a \($0.vocation)") }

/*:
 [Let's play with POP](@next)
 */



















//: [POP Exercises](@next)
// how to using markdown in Playground: https://goo.gl/YaueLv
