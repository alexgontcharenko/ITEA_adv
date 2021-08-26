//
//  PasscodeViewController.swift
//  Phonebook
//
//  Created by Steew on 15.08.2021.
//

import UIKit
import LocalAuthentication

class PasscodeViewController: UIViewController {
    let context = LAContext()

    override func viewDidLoad() {
        super.viewDidLoad()
        authUser()
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
    
}
