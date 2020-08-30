import UIKit

print("")
print("ENUM")
enum School {
    case primary
    case elementary
    case middle
    case high
}

var school: School = School.high
school = .middle
print(school)


switch school {
case .primary:
    print("primary")
case School.elementary:
    print("elementary")
case .middle, .high:
    print("advanced")
}

/* raw value */
print("")
print("*** raw value")
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach = 2
}
print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2

// enum wih raw value is an optional.
let apple: Fruit? = Fruit(rawValue: 0)
print(apple)
print(apple?.rawValue)

let peach: Fruit? = Fruit.peach
print(peach?.rawValue)

// automatic unwrap : some(value) or Nil(None)
if let orange: Fruit = Fruit(rawValue: 5) {
    print("ths type is \(orange)")
} else {
    print("no matched case")
}

// add function
print("")
print("*** add function to enum")
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("spring")
        case .jun, .jul, .aug:
            print("summer")
        case .sep, .oct, .nov:
            print("fall")
        case .dec, .jan, .feb:
            print("winter")
        }
    }
}

Month.mar.printMessage()

// iterate
print("")
print("*** iterate case")
enum Week: CaseIterable {
    case weekOne
    case weekTwo
}
for c in Week.allCases {
    print(c)
}


/* complicated enum */
enum PastaTaste {
    case cream, tomato
}

enum PizzaDough {
    case cheeseCrust, thin,original
}

enum PizzaTopping {
    case peperoni, cheese, bacon
}

enum Dish {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSourc: Bool)
    case rice
}

var dinner: Dish = Dish.pasta(taste: PastaTaste.tomato)
dinner = Dish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)
