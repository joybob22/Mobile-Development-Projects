import UIKit

struct Person {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

let bob = Person(firstName: "Bob", lastName: "The-Builder")

bob.firstName

print("\(bob.fullName) can he fix it?")
print("\(bob.firstName) \(bob.lastName) yes he can!")
