//
//  ViewController.swift
//  CommonInputControlss
//
//  Created by Brayden Lemke on 9/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextFieldOutlet: UITextField!
    @IBOutlet weak var ourBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button was tapped!")
        if let text = TextFieldOutlet.text {
            print("Text field: \(text)")
            ourBtn.setTitle(text, for: .normal)
        }
        
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("The switch is on")
        } else {
            print("The switch is off")
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
}

