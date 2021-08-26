//
//  ContactTableViewCell.swift
//  TestCoreData
//
//  Created by Steew on 08.08.2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var contactNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contactNameLabel.text = "Name"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
