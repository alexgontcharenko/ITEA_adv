//
//  Movies+CoreDataProperties.swift
//  Videos
//
//  Created by Steew on 12.08.2021.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var id: Int64

}

extension Movies : Identifiable {

}
