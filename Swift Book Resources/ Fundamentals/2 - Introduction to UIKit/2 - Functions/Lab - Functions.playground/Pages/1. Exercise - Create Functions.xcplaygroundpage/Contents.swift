/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */


//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation

func magicEightBall() {
    let randomNum = Int.random(in: 0...4)
    switch(randomNum) {
        case 0:
            print("Unknown")
        case 1:
            print("It is unlikely")
        case 2:
            print("Yes")
        case 3:
            print("Try again")
        case 4:
            print("It seems to be so")
        default:
            print("Woahhhhh I don't know how we got here")
    }
}

magicEightBall()

/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
