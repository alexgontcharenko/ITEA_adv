//
//  Contact+CoreDataProperties.swift
//  TestCoreData
//
//  Created by Steew on 10.08.2021.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}

extension Contact : Identifiable {

}
