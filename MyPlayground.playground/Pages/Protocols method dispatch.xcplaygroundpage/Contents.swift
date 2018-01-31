protocol MyProtool {
    func myProtocolRequireMethod()
    
}

extension MyProtool {
    func myProtocolRequireMethod() {
        print("Extension myProtocolRequireMethod\n")
    }
    func myProtocolWithoutMethod() {
        print("Extension myProtocolWithoutMethod\n")
    }
}

struct MyStruct: MyProtool {
    func myProtocolRequireMethod() {
        print("MyStruct myProtocolRequireMethod\n")
    }
    func myProtocolWithoutMethod() {
        print("MyStruct myProtocolWithoutMethod\n")
    }
}
let myStruct = MyStruct()

myStruct.myProtocolRequireMethod() // MyStruct myProtocolRequireMethod
(myStruct as! MyProtool).myProtocolRequireMethod() // MyStruct myProtocolRequireMethod
//
myStruct.myProtocolWithoutMethod() // MyStruct myProtocolWithoutMethod
//
(myStruct as! MyProtool).myProtocolWithoutMethod() //Extension myProtocolWithoutMethod


