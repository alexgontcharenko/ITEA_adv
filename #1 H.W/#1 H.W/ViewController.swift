//
//  ViewController.swift
//  #1 H.W
//
//  Created by Steew on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var modeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modeSwitch.isOn = UserInterfaceStyleManager.shared.currentStyle == .dark
        startObserving(&UserInterfaceStyleManager.shared)
    }
    
    @IBAction func darkModeSwitchValueChanged(_ sender: Any) {
        let darkModeOn = modeSwitch.isOn
        
        // 2
        // Store in UserDefaults
        UserDefaults.standard.set(darkModeOn, forKey: UserInterfaceStyleManager.userInterfaceStyleDarkModeOn)
        
        // 3
        // Update interface style
        UserInterfaceStyleManager.shared.updateUserInterfaceStyle(darkModeOn)
    }
}

