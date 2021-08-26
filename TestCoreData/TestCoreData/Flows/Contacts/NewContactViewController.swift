//
//  NewContactViewController.swift
//  TestCoreData
//
//  Created by Steew on 03.08.2021.
//

import UIKit
import CoreData

class NewContactViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var saveContactButton: UIButton!
    
    private var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func saveData(name: String, phone: String) {
        let contact = Contact(
            entity: Contact.entity(),
            insertInto: appDelegate.persistentContainer.viewContext
        )
        
        contact.name = name
        contact.phone = phone
        
        appDelegate.saveContext()
    }
    
    @IBAction func onTapSaveContact(_ sender: Any) {
        saveData(name: nameTextField.text!, phone: phoneTextField.text!)
    }
    
}
