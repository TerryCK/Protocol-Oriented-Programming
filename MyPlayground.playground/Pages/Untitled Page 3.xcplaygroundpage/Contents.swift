enum Error {
    case number(Int)
    case message(String)
    case fatal(num: Int, message: String)
}

let x : Int? = 1

switch x {
case let y?:
    print(y)
default:
    print(x)
}


