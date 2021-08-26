//
//  ViewController.swift
//  TestCoreData
//
//  Created by Steew on 03.08.2021.
//

import UIKit
import CoreData

class ContactsViewController: UIViewController {
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var addContactButton: UIBarButtonItem!
    
    let participants = NetworkManager().fetchParticipants()
    
    private let fetchedResultsCellIdn = "ContactTableViewCell"

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var fetchRVC: NSFetchedResultsController<Contact>!
    private var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
//        getAllContacts()
//        getData()
        
//        let decoder = JSONDecoder()
//                let JSON = """
//                {
//                    "name": "name",
//                    "position": "position"
//                }
//                """
//                let jsonData = JSON.data(using: .utf8)!
//                let participant = try? decoder.decode(Participant.self, from: jsonData)
//        
//        appDelegate.saveContext()
        
        participants.forEach { (participant) in
            print(participant.name)
        }
        
    }

    private func getData() -> [Contact] {
        let contacts = try? appDelegate.persistentContainer.viewContext.fetch(Contact.fetchRequest()) as? [Contact]
        
        contacts?.forEach({ contact in
            print("______")
            print("\(contact.name ?? "")")
            print("\(contact.phone ?? "")")
        })
        
        return contacts!
    }
    
    private func getAllContacts() {
      let request = Contact.fetchRequest() as NSFetchRequest<Contact>
      // crash sortDescriptor must have
      let sortDescriptor = NSSortDescriptor(key: #keyPath(Contact.name), ascending: true)
      request.sortDescriptors = [sortDescriptor]

      do {
        fetchRVC = NSFetchedResultsController(
          fetchRequest: request,
          managedObjectContext: context,
          sectionNameKeyPath: #keyPath(Contact.name),
          cacheName: nil
        )
        try fetchRVC.performFetch()
        contactsTableView.reloadData()
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }
}

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData().count
    }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: fetchedResultsCellIdn,
      for: indexPath
    ) as? ContactTableViewCell else {
      return ContactTableViewCell()
    }
    let item = getData()
    cell.contactNameLabel.text = item[indexPath.row].name
//    cell.contactNameLabel.text = "\(item.name[indexPath])"
//    cell.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
    return cell
  }
}

