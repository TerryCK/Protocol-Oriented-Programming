enum Status: String {
    case on, off, none
    init(str: String) {
        switch str {
        case "on":
            self = .on
        case "off":
            self = .off
        default:
            self = .none
        }
    }
}


let string : String? = "on"


let x = string.map ( Status.init )
print(type(of: x))


