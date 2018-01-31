// Defined protocol.
protocol A {
    func a() -> Int
}
extension A {
    func a() -> Int {
        return 0
    }
}

// A class doesn't have implement of the function.
class B: A {}

class C: B {
     func a() -> Int {
        return 1
    }
}

// A class has implement of the function.
class D: A {
    func a() -> Int {
        return 1
    }
}

class E: D {
    override func a() -> Int {
        return 2
    }
}

// Failure cases.
B().a() // 0
C().a() // 1
(C() as A).a() // 0 # We thought return 1.

// Success cases.
D().a() // 1
(D() as A).a() // 1
E().a() // 2
(E() as A).a() // 2


protocol MyProotocol {
//    static func myMethod()
}


extension MyProotocol {
    static func myMethod() {
        print("implement on MyProtocol extension")
    }
}


struct MyStruct: MyProotocol {
    static func myMethod() {
        print("implement on MyStruct")
    }
}


MyStruct.myMethod()








extension Sequence {
    
}
