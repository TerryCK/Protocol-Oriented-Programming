protocol Bird: CustomStringConvertible {
    var name: String { get }
    var canFly: Bool { get }
}

extension CustomStringConvertible where Self: Bird {
    var description: String {
        return canFly ? "I can fly" : "Guess I’ll just sit here :["
    }
}
extension Bird {
    // Flyable birds can fly!
    var canFly: Bool { return self is Flyable }
    
}


protocol Flyable {
    var airspeedVelocity: Double { get }
}

struct FlappyBird: Bird, Flyable {
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airspeedVelocity: Double {
        return 3 * flappyFrequency * flappyAmplitude
    }
}

struct Penguin: Bird {
    let name: String
   
}


struct SwiftBird: Bird, Flyable {
    var name: String { return "Swift \(version)" }
    let version: Double
    
    
    // Swift is FASTER every version!
    var airspeedVelocity: Double { return version * 1000.0 }
}



struct BirdTEST: Bird {
    var name: String
    var airspeedVelocity: Double { return  1000.0 }
}
let x = BirdTEST(name: "test")
x.canFly

let y = SwiftBird(version: 102)
y.canFly

enum UnladenSwallow: Bird, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch self {
        case .african:
            return "African"
        case .european:
            return "European"
        case .unknown:
            return "What do you mean? African or European?"
        }
    }
    
    var airspeedVelocity: Double {
        switch self {
        case .african:
            return 10.0
        case .european:
            return 9.9
        case .unknown:
            fatalError("You are thrown from the bridge of death!")
        }
    }
}

extension UnladenSwallow {
    var canFly: Bool {
        return self != .unknown
    }
}

UnladenSwallow.unknown.canFly


let intOfParament = 0


print(x)


let numbers = [10,20,30,40,50,60]
let slice = numbers[1...3]
let reversedSlice = slice.reversed()

let answer = reversedSlice.map { $0 * 10 }
print(answer)
