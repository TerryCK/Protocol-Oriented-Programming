extension Collection where Iterator.Element == String {
    func myMethod() {
        print("my Method")
    }
}
extension Collection {
    func myMethod() {
        print("collection my Method")
    }
}
["string"].myMethod() // print out: my Method
[1].myMethod() // print out: collection my Method

protocol Object {}
protocol Protocol {}
protocol Playground {}
typealias Summary = String
typealias Concept = String
typealias Practices = String
typealias Terry = String


protocol Outline {
    
    func introduct(with: Protocol, by sharer: Terry)    ->  Concept
    
    func whatsDifferent(between: Object, and: Protocol) ->  Summary
    
    func demo(with playground: Playground)              ->  Practices
    
    func takeAway( )                                    ->  Any?
}


