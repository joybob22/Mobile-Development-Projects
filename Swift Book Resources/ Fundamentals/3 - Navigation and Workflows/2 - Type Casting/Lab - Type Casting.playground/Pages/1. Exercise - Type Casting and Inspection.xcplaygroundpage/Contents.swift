/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let myCollection: [Any] = [12.5, 65.2, 31.38647, 4, 34, 27, 2346, true, false, false, true, "What a good day", "Life is good", "You know what I mean?"]
print(myCollection)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in myCollection {
    if let item = item as? Int {
        print("The Integer has a value of: \(item)")
    } else if let item = item as? Double {
        print("The Double has a value of: \(item)")
    } else if let item = item as? Bool {
        print("The Boolean has a value of: \(item)")
    } else if let item = item as? String {
        print("The String has a value of: \(item)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let myDictionary: [String: Any] = ["FirstName": "Brayden", "LastName": "Lemke", "Age": 22, "Money": 2_345_345.3245, "Coding": true]

//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (_, value) in myDictionary {
    if let value = value as? Int {
        total+=Double(value)
    } else if let value = value as? Double {
        total+=value
    } else if let _ = value as? String {
        total+=1
    } else if let value = value as? Bool {
        total = value ? total + 2 : total - 3
    }
}

print(total)

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for (_, value) in myDictionary {
    if let value = value as? Int {
        total2+=Double(value)
    } else if let value = value as? Double {
        total2+=value
    } else if let value = value as? String {
        if let value = Double(value) {
            total2+=value
        }
    }
}

print(total2)

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
