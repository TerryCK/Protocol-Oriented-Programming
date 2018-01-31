let strArray = ["Te","er","rr","rr","ry"]

let result = strArray.reduce("") { $0 + $1 }
print(result)
let  x = strArray.flatMap{ $0 }
let ymap = strArray.map { $0.map { "\($0)a" } }


print(x)
print(ymap)
let results = strArray.joined()
print(results)
