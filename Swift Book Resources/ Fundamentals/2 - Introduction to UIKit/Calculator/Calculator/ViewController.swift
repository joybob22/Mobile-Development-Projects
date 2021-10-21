//
//  ViewController.swift
//  Calculator
//
//  Created by Brayden Lemke on 9/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    var firstNumber: Double = 0
    var operatorSelected: String = ""
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /**
        Will run the actual math and update the numberLabel
     */
    
    func doMath() {
        switch operatorSelected {
        case "divide":
            numberLabel.text = String(Double(firstNumber) / Double(numberLabel.text!)!)
        case "times":
            numberLabel.text = String(Double(firstNumber) * Double(numberLabel.text!)!)
        case "subtract":
            numberLabel.text = String(Double(firstNumber) - Double(numberLabel.text!)!)
        default:
            //Assuming add is the only other operator
            numberLabel.text = String(Double(firstNumber) + Double(numberLabel.text!)!)
        }
    }
    
    /**
        This is the function that is built for specific numbers being tapped. Will simply update the numberLabel
     */

    @IBAction func numberTap(_ sender: UIButton) {
        clearButton.setTitle("C", for: .normal)
        let title = sender.currentTitle!
        if(numberLabel.text == "0") {
            numberLabel.text = title
        } else {
            numberLabel.text! += title
        }
    }
    
    /**
        Updates the current operator that is selected
     */
    
    @IBAction func operatorTap(_ sender: UIButton) {
        clearButton.setTitle("C", for: .normal)
        switch sender.currentTitle! {
        case "÷":
            operatorSelected = "divide"
            firstNumber = Double(numberLabel.text!)!
            numberLabel.text = "0"
        case "x":
            operatorSelected = "times"
            firstNumber = Double(numberLabel.text!)!
            numberLabel.text = "0"
        case "-":
            operatorSelected = "subtract"
            firstNumber = Double(numberLabel.text!)!
            numberLabel.text = "0"
        case "+":
            operatorSelected = "add"
            firstNumber = Double(numberLabel.text!)!
            numberLabel.text = "0"
        default:
            //Assuming the equals button has been tapped
            doMath()
        }
    }
    
    /**
        Functionality for the non generic operators (+/- and %)
     */
    
    @IBAction func uniqueOperatorTap(_ sender: UIButton) {
        let numberLabelDouble = Double(numberLabel.text!)!
        print(numberLabelDouble)
        switch sender.currentTitle! {
        case "+/-":
            if numberLabelDouble < 0 {
                numberLabel.text = String(numberLabelDouble * -1)
            } else {
                numberLabel.text = "-" + numberLabel.text!
            }
        default:
            //Assuming the percent button was pressed
            numberLabel.text = String(numberLabelDouble / 100)
        }
    }
    
    /**
        Will clear the user selections
     */
    
    @IBAction func clearTapped(_ sender: UIButton) {
        if clearButton.currentTitle! == "AC" {
            numberLabel.text = "0"
            firstNumber = 0
            operatorSelected = ""
        } else {
            numberLabel.text = "0"
            clearButton.setTitle("AC", for: .normal)
        }
        
    }
}

