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

