import UIKit

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]

/* map */
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]

doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers) // [0, 2, 4, 6, 8]

/* filter */
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered) // [0, 2, 4]

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers) // [0, 2, 4]

let oddNumbers: [Int] = numbers.filter {
    $0 % 2 != 0
}
print(oddNumbers) // [1, 3]

/* reduce */
let someNumbers: [Int] = [2, 8, 15]

// without reduce
var result: Int = 0
for number in someNumbers {
    result += number
}
print(result)

// with reduce
let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    return first + second
})

print(sum)

var subtract: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    //print("\(first) - \(second)") //어떻게 동작하는지 확인해보세요
    return first - second
})

print(subtract)

let sumFromThree = someNumbers.reduce(3) { $0 + $1 }

print(sumFromThree) // 28
