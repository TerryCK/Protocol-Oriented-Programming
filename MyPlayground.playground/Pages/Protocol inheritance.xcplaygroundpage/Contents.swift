protocol ProtocolA : ProtocolB { }
protocol ProtocolB {
    func printTerry()
}
extension ProtocolB {
    func printTerry() {
        print("Protocol B")
    }
    
    func test() {
        
    }
}

extension ProtocolA {
    func printTerry() {
        print("Protocol A")
    }
    
    
}


struct StructA: ProtocolA {
    
}
let structA: ProtocolB = StructA()

structA.printTerry()  // from comform
structA.test()        // from inheritance




