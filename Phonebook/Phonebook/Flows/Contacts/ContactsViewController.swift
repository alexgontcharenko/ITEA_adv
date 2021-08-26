//
//  ViewController.swift
//  Phonebook
//
//  Created by Steew on 26.07.2021.
//

import UIKit

class ContactsViewController: UIViewController {
    @IBOutlet weak var contactCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView() {
        contactCollectionView.dataSource = self
        contactCollectionView.delegate = self
        let layout = self.contactCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: (self.contactCollectionView.frame.size.width), height: self.contactCollectionView.frame.size.height)
    }
}

extension ContactsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCell", for: indexPath) as! CollectionViewCell
        cell.contactImage.image = UIImage(named: "cellImage")
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.contactLabel.text = "Name"
        
        return cell
    }
    
    
}

