


let amount:Double = 100
let decimal: Double = amount - Double(Int(amount))

//print(Double(Int(decimal)))

let result = decimal != 0.0 ? String(amount) : String(Int(amount))
print(result)
