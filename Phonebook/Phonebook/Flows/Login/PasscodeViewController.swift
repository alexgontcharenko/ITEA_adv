//
//  PasscodeViewController.swift
//  Phonebook
//
//  Created by Steew on 15.08.2021.
//

import UIKit
import LocalAuthentication

class PasscodeViewController: UIViewController {
    @IBOutlet var digits: [UIButton]!
    let context = LAContext()

    override func viewDidLoad() {
        super.viewDidLoad()
        authUser()
        setupDigits()
    }
    
    private func authUser() {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.localizedCancelTitle = "Enter Passcode"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate to proceed.") { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    guard let error = error else { return }
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func setupDigits() {
        digits.forEach { button in
            button.layer.cornerRadius = button.frame.width / 2
            button.backgroundColor = .clear
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
        }
    }
    
}
