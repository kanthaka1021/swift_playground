import UIKit

/* Closure */
// Function: named closure
// first citizen class

// Function
func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}
var sumResult: Int = sumFunction(a: 1, b: 2)
print(sumResult) // 3

// clousure
var sumClosure: (Int, Int) -> Int = {
    (a: Int, b: Int) -> Int in return a + b
}
sumResult = sumClosure(1, 2)
print(sumResult) // 3

let names: [String] = ["apple", "banana", "kiwi"]
func backwards(first: String, second: String) -> Bool {
    return first > second
}

let reversed1: [String] = names.sorted(by: backwards)
print(reversed1)

// basic syntax
var reverse2 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
}
)

// infered
var reverse3 = names.sorted{(s1: String, s2: String) -> Bool in return s1 > s2 }

var reverse4 = names.sorted(by: { s1, s2 in s1 > s2 } )

// short hand argument
let reverse5: [String] = names.sorted { return $0 > $1 }

// short hand argument and implicit return
let reverse6: [String] = names.sorted { $0 > $1 }

/* Capturing Values */
// A closure can capture constants and variables from the surrounding contex
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int { // this closure capture variables: amount, runingTotal
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}


// Closures Are Reference Types
let incrementByTen = makeIncrementer(forIncrement: 10)
let first: Int = incrementByTen()
let second: Int = incrementByTen()
let third: Int = incrementByTen()

let incrementByTwo = makeIncrementer(forIncrement: 2)
let first2: Int = incrementByTwo()
let second2: Int = incrementByTwo()
let third2: Int = incrementByTwo()



// Escaping Closure
var completionHandlers = [() -> Void]()

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) { // escaping closure is stored by outside this function.
    completionHandlers.append(completionHandler)
}

typealias VoidVoidClosure = () -> Void

let firstClosure: VoidVoidClosure = {
    print("closure A")
}

let secondClosure: VoidVoidClosure = {
    print("closure B")
}

// first and second are escaping closure because one of them is being returned
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, isSel: Bool)-> VoidVoidClosure {
    return isSel ? first: second }

let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, isSel: true)

returnedClosure()

// closures will be stored outside the function
var closures: [VoidVoidClosure] = []
func appendClosure(closure: @escaping VoidVoidClosure) {
    closures.append(closure)
}


// A lets you delay evaluation
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider: () -> String = { return customersInLine.removeFirst() }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"


// @autoclosure is hardly used in most of coding.
