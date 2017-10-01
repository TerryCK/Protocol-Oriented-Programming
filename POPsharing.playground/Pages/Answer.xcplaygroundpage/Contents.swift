
/*:
 ## Protocol Oriented Programming Exercise
 
 ### Exercises
 
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
 - Counter of even and odd
 
 */

/*:
 ## Exercise 1
 ##### Counter of even and odd
 - [1,2,3,4,5,6,7].countOddEven() -> (odd: 4, even: 3)
 - [2,4,6,8,10].countOddEven() -> (odd: 0, even: 5)
 - [1,3,5,7,9].countOddEven() -> (odd: 5, even: 0)
 */

















/*:
 ## Exercise 1 `square`
 - 2.square() -> 4
 - 4.square() -> 16
 - 6.square() -> 36
 */















// Exercise 2 Answers
extension BinaryInteger {
    func square() -> Self {
        return self * self
    }
    
    var squareProperty: Self {
        return self * self
    }
}
//: >  Capital `S` is type, lowercase `s` is an instance object








/*:
 ## Exercise 2 `clamp`
 1. Minimum 5, maximum 10, input 8
 2. Minimum 5, maximum 10, input 3 should output 5.
 3. Minimum 5, maximum 100, input 800 should output 100.
 -  10.clamp(low: 5, high: 20)  -> 10
 -   3.clamp(low: 5, high: 10)  -> 5
 - 800.clamp(low: 5, high: 100) -> 100
 */












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
    func matches(array items: [Self]) -> Bool {
        for item in items {
            if item != self {
                return false
            }
        }
        return true
    }
}


//: > `Equatable` protocol related `!=` `==`
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
    func lessThan(array itmes: [Self]) -> Bool {
        for item in itmes where item <= self {
            return false
        }
        return true
    }
}

//: > A type that can be compared using the relational operators `<, `<=`, `>=`, and `>`. public protocol `Comparable : Equatable`


5.lessThan(array: [6,7,8,9,10])
5.lessThan(array: [5,6,7])
"cat".lessThan(array: ["dog", "fish", "gorilla"])





/*: ##Exercise 5 `myContain` in `Array`, `Dictionary`, `Set`
 - `[1,1,1,1].myContain(element: 1)` -> `true`
 - `[1,2,3,4].myContain(element: 1)` -> `true`
 - `[1,2,3,4].myContain(element: 6)` -> `false`
 */

extension Collection where Iterator.Element: Equatable {
    func myContain(element: Iterator.Element) -> Bool {
        for item in self where item == element {
            return true
        }
        return false
    }
}

[1,2,3,4].myContain(element: 6)






/*: ## Exercise 6 `fuzzyMatches`
 
 1. Using `[1, 2, 3].fuzzyMatches([1, 2, 3])` will return true
 2. Using `[1, 2, 3].fuzzyMatches([3, 2, 1])` will return true
 3. Using `[1, 2, 3].fuzzyMatches([1, 2])` will return false
 4. Using `[1, 2, 3].fuzzyMatches([1, 2, 3, 1])` will return false
 
 */

extension Collection where Iterator.Element: Comparable {
    func fuzzMatches(_ other: Self) -> Bool {
        let usSorted = self.sorted()
        let otherSorted = other.sorted()
        return usSorted == otherSorted
    }
}




[1,2,3].fuzzMatches([1,2,3])
[1,2,3].fuzzMatches([2,3,1])



/*: ## Exercise 7  `average string length`
 - `["hihihi","good", "ok"].averageLength()` return `4`
 */

extension Collection where Iterator.Element == String {
    func averageLength() -> Double {
        var sum = 0
        var count = 0
        for item in self {
            sum += item.count
            count += 1
        }
        return Double(sum) / Double(count)
        
    }
}


["你好嗎","我很好", "ok"].averageLength()




/*: ## Exercise 8  `counting integers`
 
 - The array `[5, 3, 5, 1, 5]` should return `3`.
 - The array `[5, 15]` should return `2`.
 - The array `[5, 15, 55, 555]` should return `7`.
 - The array `[555, 555, 555]` should return `9`.
 
 */



extension BinaryInteger  {
    func myCalcultor(elements: [Self]) -> Int {
        let refer: Character = Character(String(describing: self))
        var count: Int = 0
        
        for element in elements {
            String(describing: element).forEach {
                if $0 == refer {
                    count += 1
                }
            }
        }
        return count
    }
}

5.myCalcultor(elements: [5,555,5555,555])
1.myCalcultor(elements: [10,1,0,5])
5.myCalcultor(elements: [5,3,5,1,5])
5.myCalcultor(elements: [5,15,55,555])




/*: ## Exercise 8 - 2 `counting integers`
 
 - `[12,32,34,1,23,124,12,3].number(of: 2)` return `0`
 
 */

extension Collection where Iterator.Element: BinaryInteger {
    func number(of arg: Int) -> Int {
        var count: Int = 0
        let ref = Character(String(describing: arg))
        for element in self {
            let str = String(describing: element)
            for letter in str.characters {
                if letter == ref {
                    count += 1
                }
            }
        }
        return count
    }
}

[12,32,34,1,23,124,12,3].number(of: 2)
[2,3].number(of: 2)



/*: ## Exercise 9  `De-duping an array`
 
 - `[1,2,4,5,6,7,1,2,4,3].uniqueValue()`
 
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

[1,2,4,5,6,7,1,2,4,3].uniqueValue()



[1,23,21,412,312].uniqueValue()
[1,2,3,12,3,4].uniqueValue().count
[1,2,3,12,3,4].count



/*: ## Exercise 10  `Array is sorted`
 
 1. The array `[1, 3, 5]` should return `true`.
 2. The array `[5, 3, 1]` should return `false`.
 */



extension Array where Element: Comparable {
    func isSorted() -> Bool {
        return self == self.sorted()
    }
}



//
//
//extension Collection where Iterator.Element: Comparable {
//    func isSorted() -> Bool {
//        return Array(self) == self.sorted()
//    }
//}




//: [Next](@next)
