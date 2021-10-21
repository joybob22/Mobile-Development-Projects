//
//  ViewController.swift
//  appLifecycle
//
//  Created by Brayden Lemke on 10/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    var sceneWillConnectCount = 0
    var sceneDidBecomeActiveCount = 0
    var sceneWillResignCount = 0
    var sceneWillEnterForegroundCount = 0
    var sceneDidEnterBackgroundCount = 0

    @IBOutlet weak var appLaunchLabel: UILabel!
    @IBOutlet weak var sceneConfiguredLabel: UILabel!
    @IBOutlet weak var sceneWillConnectLabel: UILabel!
    @IBOutlet weak var sceneDidBecomeActiveLabel: UILabel!
    @IBOutlet weak var sceneWillResignLabel: UILabel!
    @IBOutlet weak var sceneWillEnterForegroundLabel: UILabel!
    @IBOutlet weak var sceneDidEnterBackgroundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        appLaunchLabel.text = "App Launch: \(appDelegate.launchCount)"
        sceneConfiguredLabel.text = "Scene configured: \(appDelegate.configurationForConnectingCount)"
        
        sceneWillConnectLabel.text = "Scene will connect: \(sceneWillConnectCount)"
        sceneDidBecomeActiveLabel.text = "Scene did become active: \(sceneDidBecomeActiveCount)"
        sceneWillResignLabel.text = "Scene will resign active: \(sceneWillResignCount)"
        sceneWillEnterForegroundLabel.text = "Scene will enter foreground: \(sceneWillEnterForegroundCount)"
        sceneDidEnterBackgroundLabel.text = "Scene did enter background: \(sceneDidEnterBackgroundCount)"
        
    }


}

