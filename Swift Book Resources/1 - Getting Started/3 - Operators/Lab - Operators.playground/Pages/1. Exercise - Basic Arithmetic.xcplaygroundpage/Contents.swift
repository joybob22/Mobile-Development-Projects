/*:
## Exercise - Basic Arithmetic
 
 You decide to build a shed and want to know beforehand the area of your yard that it will take up. Create two constants, `width` and `height`, with values of 10 and 20, respectively. Create an `area` constant that is the result of multiplying the two previous constants together, and print out the result.
 */
let width = 10
let height = 20
let area = width * height
print("Area: \(area)\n")
//:  You decide that you'll divide your shed into two rooms. You want to know if dividing it equally will leave enough room for some of your larger storage items. Create a `roomArea` constant that is the result of dividing `area` in half. Print out the result.
let roomArea = area / 2
print("Room Area: \(roomArea)\n")
//:  Create a `perimeter` constant whose value equals `width` plus `width` plus `height` plus `height`, then print out the result.
let perimeter = width + width + height + height
print("Perimeter: \(perimeter)\n")
//:  Print what you would expect the result of integer division of 10 divided by 3 to be. Create a constant, `integerDivisionResult` that is the result of 10 divided by 3, and print the value.
print("Expected result of dividing the two integers 10 and 3: 3")
let integerDivisionResult = 10 / 3
print("The actual result of dividing the two integers 10 and 3: \(integerDivisionResult)\n")

//:  Now create two constants, `double10` and `double3`, set to 10 and 3, and declare their types as `Double` values. Declare a final constant `divisionResult` equal to the result of `double10` divided by `double3`. Print the value of `divisionResult`. How does this differ from the value when using integer division?
let double10:Double = 10;
let double3:Double = 3;
let divisionResult = double10 / double3
print("Division Result: \(divisionResult)")
print("This differs from the integer division because we are using doubles which allows for a more accuate result with decimals\n")
/*:
 Given the value pi (3.1415927), create a `radius` constant with a value of 5.0, then calculate the diameter and circumference of the circle using the following equations, and print the results:
 
 *diameter = 2 * radius*
 
 *circumference = 2 * pi * radius.*
 */
let pi = 3.1415927 
let radius = 5.0
let diameter = 2 * radius
let circumference = 2 * pi * radius
print("Diameter: \(diameter)")
print("Circumference: \(circumference)\n")
//:  Create an integer constant. Using the modulus operator, set its value to the remainder of 12 divided by 5.
let remainder = 12 % 5

//:  Create two integer constants, `even` and `odd` and set them to any even integer and any odd integer, respectively. For each, print the remainder of dividing the value by 2. Looking at the results, how do you think you could use the remainder operator to determine if an integer is even or odd?
let even = 10
let odd = 5
print("Even: \(even % 2)")
print("Odd: \(odd % 2)")
print("If you want to find if a number is even or odd you can use the modulus by saying someNumber % 2. This will result in 0 if the number is even and will result in 1 if the numebr is odd.")
/*:
page 1 of 8  |  [Next: App Exercise - Fitness Calculations](@next)
 */
