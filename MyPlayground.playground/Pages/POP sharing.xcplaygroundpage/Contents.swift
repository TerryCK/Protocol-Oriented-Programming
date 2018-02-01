import Foundation


protocol Life {
    var heartRate       : Int     { get }
    var isBreathe       : Bool    { get }
    var isMetabolism    : Bool    { get }
    var isReproduction  : Bool    { get }
}

extension Life {
    var heartRate       : Int     { return   75  }
    var isBreathe       : Bool    { return  true }
    var isMetabolism    : Bool    { return  true }
    var isReproduction  : Bool    { return  true }
}

struct Car {
    var name: String
}

protocol Driver {
    associatedtype Vehicle
    func drive(with vehicle: Vehicle)
}

extension Driver {
    func drive(with vehicle: Car) {
        print("we drive with \(vehicle.name)")
    }
    private func privateMethod() -> String {
        return "somelogic in private"
    }
}


protocol TennisPlay {
    var canPlayTennis: Bool { get }
    func forehandShot()
    func backhandShot()
}

extension TennisPlay {
    var canPlayTennis: Bool { return true }
    func forehandShot() {}
    func backhandShot() {}
}


class Person: Life {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let terry = Person(name: "Terry") // construct

terry.heartRate         // 75
terry.isBreathe         // true
terry.isMetabolism      // true
terry.isReproduction    // true



// true
//

//struct Person: Life, TennisPlay, Driver {
//    var name: String
//}
//
//let terry = Person(name: "Terry")
//terry.isBreathe
//terry.drive(with: Car(name: "Tesla"))
//terry.canPlayTennis

