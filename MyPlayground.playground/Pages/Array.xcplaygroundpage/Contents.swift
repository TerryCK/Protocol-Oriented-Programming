let myArray = [1,2,3,4]

print(myArray[0])
print(myArray.first)


enum Number: Int {
    case one, two
}


struct MyStruct: Codable {
    var aString: String
    init() {
        self.aString = ""
    }
    mutating func change(string: String) {
        self.aString = string
    }
}


var myStruct = MyStruct()
myStruct.change(string: "test")
myStruct.aString

let number = Number(rawValue: 1)

number?.rawValue


let strArray: [String] = ["Terry", "Chen"]


strArray.reduce("") { (result, msgBody)  in
    return result + msgBody
}

let x = String(strArray.reduce("", { (result, str) -> String in
    return result + str + "\n"}).characters.dropLast())

print(x)
print("-----")
let newMothed = strArray.reduce("") {  $0 + $1 + "\n" }.dropLast()

print(newMothed)
print("-----")
type(of: x)
type(of: (newMothed))





let testbutton1 = false
let testbutton2 = true



if testbutton1, testbutton2 {
    print("pass")
}

let aNumber = 10
let baseNumber = 10
let anotherNumber = 3





if baseNumber <= aNumber, anotherNumber > 1  {
   print("Pass OK")
}else if (baseNumber == aNumber && anotherNumber > 1) {
    print("Pass OK")
}





