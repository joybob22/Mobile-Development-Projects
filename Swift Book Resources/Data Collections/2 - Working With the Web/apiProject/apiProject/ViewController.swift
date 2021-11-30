//
//  ViewController.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/16/21.
//

import UIKit

class ViewController: UIViewController {
    
    var dogController = DogController()

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dogController.fetchData { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    @IBAction func newDogTapped(_ sender: Any) {
        dogController.fetchData { result in
        switch result {
        case .success(let image):
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        case .failure(let err):
            print(err.localizedDescription)
        }
    }
    }
    
}

