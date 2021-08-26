//
//  Participant+CoreDataProperties.swift
//  TestCoreData
//
//  Created by Steew on 10.08.2021.
//
//

import Foundation
import CoreData


extension Participant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Participant> {
        return NSFetchRequest<Participant>(entityName: "Participant")
    }

    @NSManaged public var name: String?
    @NSManaged public var position: String?

}

extension Participant : Identifiable {

}
