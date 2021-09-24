//
//  ViewController.swift
//  Two Buttons
//
//  Created by Brayden Lemke on 9/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setText(_ sender: UIButton) {
        myLabel.text = myTextField.text
    }
    
    @IBAction func clearText(_ sender: UIButton) {
        myLabel.text = ""
        myTextField.text = ""
    }
    
}

