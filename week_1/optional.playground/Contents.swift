import UIKit
print("")
print("ENUM")
enum School {
    case primary
    case elementary
    case middle
    case high
}

// nil cannot be assigned with non optional value
// var nilname: String = nil

// both are not none type(nil) values
var name: String = ""
var num: Int = 0

// To use empty or abnormal value, optional is good way to handle unexpected values.
// Use question mark
var opname: String? = "Alex" // some("Alex") or Nil

// use optional biding instead of using exclamation mark.
if let name: String = opname {
    print(name)
} else {
    print("name == nil")
}

// it has possibility ocurring run time exception.
var yourName: String! = nil // nil

/* optional chaining */
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}


let gname: Person? = Person(name: "Justin")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let aname: Person? = Person(name: "Guard")


// without optional chaining
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print(guardJob)
                } else {
                    print("no guard job")
                }
            }
        }
    }
}

guardJob(owner: gname)

// with optional chaining
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print(guardJob)
    } else {
        print("no guard job")
    }
}

guardJobWithOptionalChaining(owner: gname)

gname?.home?.guard?.job // nil
gname?.home = apart

gname?.home // Optional(Apartment)
gname?.home?.guard // nil

gname?.home?.guard = aname

gname?.home?.guard // Optional(Person)

gname?.home?.guard?.name
gname?.home?.guard?.job

gname?.home?.guard?.job = "guard"


var guardJob: String
    
guardJob = gname?.home?.guard?.job ?? "unknown job"
print(guardJob)

gname?.home?.guard?.job = nil

guardJob = aname?.home?.guard?.job ?? "unknown job2"
print(guardJob)
