//: [Previous](@previous)
//
// String
// Int
// Double

// OOP         POP
//       抽象
//       封裝
// 單一繼承   多重合成
//      多型


// 低耦合
protocol CarProtocol {
    func move()
    var name: String { get  }
    var color: String { get  }
}


extension CarProtocol {
    func move() {
        print("do something")
    }
    var name: String  { return "" }
    var color: String  { return "" }
}

protocol BusProtocol: CarProtocol {
    
}

extension BusProtocol {
    func move() {
        print("bus moving")
        moveDetail()
    }
    
    private func moveDetail() {
        print("move detail")
    }
}

protocol Washable {
    
}

extension Washable {
    func wash() {
        print("car washing")
    }
}

struct Car: BusProtocol { }



let car = Car()
car.move()
//                         Self.Element: BinaryInteger
//                         Self.Element: Int
extension Collection where Self.Element == Int {

    func countOddEven() -> (odd: Int, even: Int) {
        
        // Functional programming reduce map filter
        
        // func a() {}
        // func b(a) -> a {}
//        () -> void
        
        func a(result: (Int ,Int) , element: Self.Element) -> (Int ,Int) {
          
            return (element % 2 == 0) ? (result.0 + 1, result.1) : (result.0 , result.1 + 1)
            }
        
        reduce((0,0), a)
        
    
//        return reduce((0,0))
        
        
        var evenCount = 0
        var oddCount = 0
        
        for item in self {
//            if item % 2 == 0 {
//                evenCount += 1
//            } else {
//                oddCount += 1
//            }
        }
        return (oddCount, evenCount)
    }
}


//Dictionary Array Set

[1,2,3,4,5].countOddEven() //-> 3, 2
[1,2,3,4,5,6].reduce(0, +)





//class Bus2: BusProtocol {
//    var name: String
//
////    func move() {
////
////    }
////
////    var name: String = ""
////
////    var color: String = ""
//
//
//}

//struct Bus: BusProtocol {
////    func move() {
////        <#code#>
////    }
////
////    var name: String
////
////    var color: String
//
//
//}



//class Car {
//    let name: String
//    let color: String
//
//    init(name: String, color: String) {
//        self.name = name
//        self.color = color
//    }
//    func move() {
//
//    }
//}
//
//class Truck {
//    let name: String = ""
//}

//let car = Car(name: "BMW", color: "Red")


























//
//
//
//
//class Car {
//    private var wheels: Int?
//    private var engine: String?
//    private var color: String
//    private var name: String
//
//    init(name: String = "new Car" , wheels: Int = 4, engine: String = "BMW", color: String = "Red") {
//        self.color = color
//        self.engine = engine
//        self.wheels = wheels
//        self.name = name
//    }
//
//    func goForward() {
//        print("\(name) boom!! \n" )
//    }
//
//}
//
//
//var bmw = Car(name: "bmw", wheels: 4, engine: "寶馬", color: "Red")
//let benz = Car(name: "benz", wheels: 4, engine: "賓士", color: "White")
//bmw.wheels
//
////bmw.goForward()
////
////benz.goForward()
//
//class Truck: Car {
//}
//
//class Bus: Car {
//
//}
//
//let truck = Truck(name: "volvo", wheels: 6, engine: "Benz", color: "Black")
//
////truck.goForward()
//
//var bus: Bus = Bus()
//let cars: [Car] = [bus, bmw, truck]
//for car in cars {
//    car.goForward()
//}

