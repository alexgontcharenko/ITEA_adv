//
//  Event+CoreDataProperties.swift
//  TestCoreData
//
//  Created by Steew on 10.08.2021.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?

}

extension Event : Identifiable {

}
