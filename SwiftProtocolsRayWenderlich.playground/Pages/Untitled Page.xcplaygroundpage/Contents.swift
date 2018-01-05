//: ## Introducing Protocol-Oriented Programming in Swift 3
//: [http://www.raywenderlich.com/109156/introducing-protocol-oriented-programming-in-swift-3](http://www.raywenderlich.com/109156/introducing-protocol-oriented-programming-in-swift-3)

import Foundation

protocol Bird: CustomStringConvertible {
  var name: String { get }
  var canFly: Bool { get }
}

extension CustomStringConvertible where Self: Bird {
  var description: String {
    return canFly ? "I can fly" : "Guess I'll just sit here :["
  }
}

//: > Extending `Bird` to have default behavior means that `Bird` types that are also `Flyable` no longer need to implement the `canFly` property themselves.

extension Bird {
  // Flyable birds can fly!
  var canFly: Bool { return self is Flyable }
}

protocol Flyable {
  var airspeedVelocity: Double { get }
}

//: Define some more `Bird` types.

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
  
  // Swift is FASTER with each version!
  var airspeedVelocity: Double { return version * 1000.0 }
}

//: > One of the benefits of protocol extensions over base classes is that you can define default behavior for any type, not just classes. In this case, the `Bird` and `Flyable` protocols are adopted by an `enum`.

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
//: Override `canFly` for `UnladenSwallow`  Unknown Swallows cannot fly.

extension UnladenSwallow {
  var canFly: Bool {
    return self != .unknown
  }
}

//: > Now, `UnladenSwallow.african` will evaluate to the Bird CustomStringConvertible.
//: > Because swallows can fly, this evaluates to 'I can fly'.

UnladenSwallow.african

//: > Even though UnladenSwallow.unknown conforms to Flyable it returns false for flying

UnladenSwallow.unknown.canFly  // false
UnladenSwallow.african.canFly  // true
Penguin(name: "King Penguin").canFly  // false

//: #### Collection Wrappers
//: > The type of `reveredSlice` is `ReversedRandomAccessCollection<ArraySlice<Int>>` which is just a view into the original array and requires no additional allocations. This makes slicing and chaining operations very cheap.  Because `map` is defined as a protocol extension to `Sequence` and both `Array` and `ReversedRandomAccessCollection` conform to `Sequence` we can just as easily call `map` on the reversed slice as we can on the original array.

let numbers = [10,20,30,40,50,60]
let slice = numbers[1...3]
let reversedSlice = slice.reversed()

let answer = reversedSlice.map { $0 * 10 }
print(answer)

//: #### And now for something completely different.
//: Motorcycles have nothing in common with birds. They aren't even value types.

class Motorcycle {
  init(name: String) {
    self.name = name
    speed = 200
  }
  var name: String
  var speed: Double
}

//: #### Racing
//: You will need to handle your racers polymorphically.  Define a `Racer` protocol.

protocol Racer {
  var speed: Double { get }  // speed is the only thing racers care about
}

//: Make all of your types conform to Racer. You don't have to modify the original model but can re-open them to add this functionality.  This is known as retroactive modelling.

extension FlappyBird: Racer {
  var speed: Double {
    return airspeedVelocity   // Just use airspeedVelocity for speed.
  }
}

extension SwiftBird: Racer {
  var speed: Double {
    return airspeedVelocity
  }
}

extension Penguin: Racer {
  var speed: Double {
    return 42  // full waddle speed
  }
}

// Nothing to do because you already implemented speed. Just declare conformance.

extension Motorcycle: Racer {}

// Prevent fatal errors for Swallows that don't fly

extension UnladenSwallow: Racer {
  var speed: Double {
    return canFly ? airspeedVelocity : 0
  }
}

//: Put all of your Racer conforming types into an Array of the protocol.
let racers: [Racer] =
  [UnladenSwallow.african,
   UnladenSwallow.european,
   UnladenSwallow.unknown,
   Penguin(name: "King Penguin"),
   SwiftBird(version: 3.0),
   FlappyBird(name: "Felipe", flappyAmplitude: 3.0, flappyFrequency: 20.0),
   Motorcycle(name: "Giacomo")
  ]

//: Define a topSpeed method that chooses the top speed from a collection of racers

func topSpeed(of racers: [Racer]) -> Double {
  return racers.max(by: { $0.speed < $1.speed })?.speed ?? 0
}

topSpeed(of: racers) // 3000

//: Define a generic version topSpeed to allow any collection wrapper such as a Slice of Racers to compile.

func topSpeed<RacerType: Sequence>(of racers: RacerType) -> Double
  where RacerType.Iterator.Element == Racer
{
  return racers.max(by: { $0.speed < $1.speed })?.speed ?? 0
}

topSpeed(of: racers[1...3]) // 42

//: Make `topSpeed()` an extension to collections of racers to make it more discoverable.

extension Sequence where Iterator.Element == Racer {
  func topSpeed() -> Double {
    return self.max(by: { $0.speed < $1.speed })?.speed ?? 0
  }
}

racers.topSpeed() // works 3000
racers[1...3].topSpeed() // also works 42

//: > Swift 3 allows operators to be implemented as static methods within a type. Previously, they had to be global functions.

protocol Score: Equatable, Comparable {
  var value: Int { get }
}

struct RacingScore: Score {
  let value: Int
  
  static func ==(lhs: RacingScore, rhs: RacingScore) -> Bool {
    return lhs.value == rhs.value
  }
  
  static func <(lhs: RacingScore, rhs: RacingScore) -> Bool {
    return lhs.value < rhs.value
  }
}

RacingScore(value: 150) >= RacingScore(value: 130)


let hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
let greatestHue = hues.max { a, b in a.value < b.value }
print(greatestHue)
// Prints "Optional(("Heliotrope", 296))"

