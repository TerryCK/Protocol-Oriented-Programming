
/*:
 ## Protocol Oriented Programming Exercise
 
 
 ### Exercises
 
 0.  Warm up Counter of even and odd
 1.  Squaring integers
 2.  Clamping integers
 3.  Matching value types
 4.  Comparing arrays
 5.  Rewriting contains()
 6.  Fuzzy array matching
 7.  Average string length
 8.  Counting integers
 9.  De-duping an array
 10. Array is sorted
 
 ###### for more information :
 
 
 -  WWDC 2015 Section 408 Protocol-Oriented Programming , Apple.
 -  "Pro Swift", Hacking with Swift
 
 */

protocol Employee {
    func payWages()
}

extension Employee {
    func payWages() {
        print("get pay 22k")
    }
}
protocol NewEmployee {
    func payWages()
}

extension NewEmployee {
    func payWages() {
        print("get pay 33k")
    }
}



protocol ProvidesTreatment {
    func treat(name: String)
}


extension ProvidesTreatment {
    func treat(name: String) {
        print(" i have treated \(name)")
    }
}



struct Slave: NewEmployee, ProvidesTreatment { }
struct Manager: NewEmployee { }


let bill = Manager()

bill.payWages()

let bob = Slave()

bob.treat(name: "cancer")



extension Collection where Iterator.Element == Int {
    func countOddEven() -> (odd: Int, even: Int) {
        var odd: Int = 0
        var even: Int = 0
        for number in self {
            if number % 2 == 0 {
                even += 1
            } else {
                odd += 1
            }
            
        }
        return (odd, even)
    }
}

[1,2,3,4,5,6,7].countOddEven()
[2,4,6,8,10].countOddEven()
[1,3,5,7,9].countOddEven()

/*:
 ## Exercise 1 `square`
 - `2.square()` return `4`
 - `4.square()` return `16`
 - `6.square()` return `36`
 */


// struct
extension Int {
    func square() -> Int {
        return self * self
    }
}


// protocol
extension BinaryInteger {
    func square() -> Self {
        return self * self
    }
}

let a: Int  = 2
let b = a.square()

2.square()
4.square()
6.square()

/*:
 ## Exercise 2 `clamp`
 1. Minimum 5, maximum 10, input 8
 2. Minimum 5, maximum 10, input 3 should output 5.
 3. Minimum 5, maximum 100, input 800 should output 100.
 -  10.clamp(low: 5, high: 20)  -> 10
 -   3.clamp(low: 5, high: 10)  -> 5
 - 800.clamp(low: 5, high: 100) -> 100
 */


extension Numeric where Self: Comparable {
    func clamp(low: Self, high: Self) -> Self {
        return max( min(self, high), low)
    }
}

10.clamp(low: 5, high: 20)
1.clamp(low: 5, high: 20)
800.clamp(low: 5, high: 100)



extension BinaryInteger {
    func clamp(low: Self, high : Self) -> Self {
        return max(low, min(self, high))
    }
}

10.clamp(low: 11, high: 20)

//: > The `BinaryInteger` protocol is the basis for all the integer types provided by the standard library. All of the standard library's integer types, such as `Int` and `UInt32`, conform to `BinaryInteger`.

/*:
 ## Exercise 3 `matches`
 
 - `2.matches(array: [2, 2, 2, 2])` will return `true`
 - `2.matches(array: [2, 2, 2, 3])` will return `false`
 */

extension Equatable {
    func matches(array: [Self]) -> Bool {
        for element in array {
            if element != self {
                return false
            }
        }
        return true
    }
}


"嗨嗨".matches(array: ["嗨","嗨嗨"])
"嗨".matches(array: ["123", "13"])


2.matches(array: [2, 2, 2, 2])
2.matches(array: [2, 2, 2, 3])

//: > `Equatable` protocol related `!=` or `==`
/*: another way:
 for item in items where item != self {
 return false
 }
 */



/*:
 ## Exercise 4 `lessThan`
 1. Running `5.lessThan(array: [6, 7, 8])` should return `true`.
 2. Running `5.lessThan(array: [5, 6, 7])` should return `false`.
 3. Running `"cat".lessThan(array: ["dog", "fish", "gorilla"])` should return `true`.
 */

extension Comparable {
    func lessThan(array: [Self]) -> Bool {
        for element in array where element <= self {
            return false
        }
        
        return true
    }
}

5.lessThan(array: [6,7,8])
5.lessThan(array: [5,6,7])

"cat".lessThan(array: ["dog", "fish", "gorilla"])


//: > A type that can be compared using the relational operators `<, `<=`, `>=`, and `>`. public protocol Comparable : Equatable



/*:
 ## Exercise 5 `myContain` in `collection`
 
 - `[1,1,1,1].myContain(element: 1)` return `true`
 - `[1,2,3,4].myContain(element: 1)` return `true`
 - `[1,2,3,4].myContain(element: 6)` return `false`
 */

extension Collection where Iterator.Element: Equatable {
    
    func myContain(element: Iterator.Element) -> Bool {
        for item in self where item == element {
            return true
        }
        return false
    }
}


[1,1,1,1].myContain(element: 1)
[1,2,3,4].myContain(element: 1)
[1,2,3,4].myContain(element: 6)




/*:
 ## Exercise 6 `fuzzyMatches`
 
 1. Using `[1, 2, 3].fuzzyMatches([1, 2, 3])` will return `true`
 2. Using `[1, 2, 3].fuzzyMatches([3, 2, 1])` will return `true`
 3. Using `[1, 2, 3].fuzzyMatches([1, 2])` will return `false`
 4. Using `[1, 2, 3].fuzzyMatches([1, 2, 3, 1])` will return `false`
 
 */

extension Collection where Self.Element: BinaryInteger {
    func fuzzyMatches(_ array: [Element]) -> Bool {
        let usSorted = self.sorted()
        let otherSorted = array.sorted()
        return usSorted == otherSorted
    }
}



[1, 2, 3].fuzzyMatches([1, 2, 3])
[1, 2, 3].fuzzyMatches([3, 2, 1])
[1, 2, 3].fuzzyMatches([1, 2])



/*:
 ## Exercise 7  `average string length`
 
 - `["hihihi","good", "ok"].averageLength()` return `4`
 - `["你好嗎","我很好", "太棒了"].averageLength()` return `3`
 */

extension Collection where Self.Element == String {
    func averageLength() -> Double {
        var count = 0
        var sum = 0
        for item in self {
            sum += item.count
            count += 1
        }
        return Double(sum) / Double(count)
    }
}

["hihihi","good", "ok"].averageLength()
["你好嗎","我很好", "太棒了"].averageLength()
["123","23s","djisjdiajsdji112312"].averageLength()


/*:
 ## Exercise 8 - 1 `counting integers`
 
 - `[12,32,34,1,23,124,12,3].number(of: 2)` return `0`
 
 */



extension Collection where Self.Element: BinaryInteger {
    func number(of element: Self.Element) -> Int {
        var count = 0
        for item in self where item == element {
            count += 1
        }
        return count
    }
}



[2,12,32,34,1,23,124,12,3].number(of: 2)

[2,2,3,4,5,6].number(of: 9)



/*:
 ## Exercise 8 - 2 `counting integers`
 
 - The array `[5, 3, 5, 1, 5]` should return `3`.
 - The array `[5, 15]` should return `2`.
 - The array `[5, 15, 55, 555]` should return `7`.
 - The array `[5,555,5555,555]` should return `11`.
 
 */

extension BinaryInteger {
    func countInterger(of elements: [Self]) -> Int {
        let ref: Character = Character(String(describing: self))
        var count = 0
        for element in elements {
            String(describing: element).forEach { (charater) in
                count += charater == ref ? 1 : 0
            }
        }
        return count
    }
}

1.countInterger(of: [1,149583589341,1123])


/*:
 ## Exercise 9  `De-duping an array`
 
 - `[1, 2, 4, 5, 6, 7, 1, 2, 4, 3].uniqueValue()` return `[1, 2, 4, 5, 6, 7, 3]`
 
 */


extension Array where Element: Equatable {
    func uniqueValue() -> [Element] {
        var result = [Element]()
        for item in self {
            if !result.contains(item) {
                result.append(item)
            }
        }
        return result
    }
    
}

[1, 2, 4, 5, 6, 7, 1, 2, 4, 3].uniqueValue()


[1,23,21,412,312].uniqueValue()
[1,2,3,12,3,4].uniqueValue().count
[1,2,3,12,3,4].count

/*:
 ## Exercise 10  `Array is sorted`
 
 - The array `[1, 3, 5]` should return `true`.
 - The array `[5, 3, 1]` should return `false`.
 */

extension Array where Element: Comparable {
    func isSoted() -> Bool {
        return self == self.sorted()
    }
}

[1,2,3,4].isSoted()
[2,1,4,2,5].isSoted()



//: ## Congradulations you have understood with POP more. and thanks for your attention
