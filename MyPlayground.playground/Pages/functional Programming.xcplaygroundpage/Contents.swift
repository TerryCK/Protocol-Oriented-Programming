
precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator >>>: CompositionPrecedence
func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V) -> (T) -> V {
    return { rhs(lhs($0)) }
}





















let terry = (name: "Terry", cars: ["tesla, lamborghini"])
let bob = (name: "Bob", cars: ["honda, toyota"])

let people = [terry, bob]

print("\n case 1 \n")
people.map { $0.cars }.flatMap { $0 }.forEach { print($0) }

print("\n case 2 \n")
people.map { $0.cars }.joined().forEach { print($0) }


