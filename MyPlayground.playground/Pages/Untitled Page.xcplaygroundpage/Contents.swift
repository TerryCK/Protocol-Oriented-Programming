import Foundation
import UIKit

extension Bundle {
    //Bundle(for: type(of: self))
    static func getSelfBundle(typeof metadata: AnyObject) -> Bundle {
        return Bundle(for: type(of: metadata.self))
    }
}
extension UINib {
    static func getUINibName(typeof metadata: AnyObject) -> String {
        return String(describing: type(of: metadata))
    }
    static func getUINib(typeof metadata: AnyObject, bundle: Bundle) -> UINib {
        return UINib(nibName: getUINibName(typeof: metadata), bundle: bundle)
    }
}
extension NSObject {
    static var theClassName: String {
        return String(describing: self)
    }
}
class MyClass: NSObject {
    var intProperty: Int
    lazy var typeof : String  = String(describing: type(of: self))
    init(arg: Int = 0) {
        self.intProperty = arg
    }
}
print(MyClass.theClassName)


//func xFunc(metadata: AnyClass) -> String {
//    return NSStringFromClass(type(of: metadata))
//}

//let x = type(of: MyClass.self)
//let stringX = String(describing: x)
//
//String(describing: type(of: )
//let myClass = MyClass()
//let myclassx = type(of: myClass)
//let g = String(describing: myclassx)
//myClass.typeof
////myClass.uinibName

print(MyClass.theClassName)

//
//let str = xFunc(metadata: myClass.self)
//print(str)

