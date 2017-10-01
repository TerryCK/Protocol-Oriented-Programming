//: [Previous](@previous)
//
// String
// Int
// Double


class Car {
    private var wheels: Int?
    private var engine: String?
    private var color: String
    private var name: String
    
    init(name: String = "new Car" , wheels: Int = 4, engine: String = "BMW", color: String = "Red") {
        self.color = color
        self.engine = engine
        self.wheels = wheels
        self.name = name
    }
    
    func goForward() {
        print("\(name) boom!! \n" )
    }
    
}


var bmw = Car(name: "bmw", wheels: 4, engine: "寶馬", color: "Red")
let benz = Car(name: "benz", wheels: 4, engine: "賓士", color: "White")
bmw.wheels

//bmw.goForward()
//
//benz.goForward()

class Truck: Car {
}

class Bus: Car {
    
}

let truck = Truck(name: "volvo", wheels: 6, engine: "Benz", color: "Black")

//truck.goForward()

var bus: Bus = Bus()



let cars: [Car] = [bus, bmw, truck]
for car in cars {
    
    car.goForward()
}
