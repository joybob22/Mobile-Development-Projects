//
//  ViewController.swift
//  Contest
//
//  Created by Brayden Lemke on 11/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        if emailTextField.text == "" {
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 15, options: []) {
                let shakeTransform1 = CGAffineTransform(translationX: CGFloat(5), y: 0)
                
                
                self.emailTextField.transform = shakeTransform1
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 15, options: []) {
                    self.emailTextField.transform = CGAffineTransform(translationX: -5, y: 0)
                } completion: { _ in
                   
                }
            }

            
        } else {
            performSegue(withIdentifier: "submitSuccessful", sender: sender)
        }
    }
    
}

