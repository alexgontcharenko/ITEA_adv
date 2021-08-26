//
//  Movies+CoreDataClass.swift
//  Videos
//
//  Created by Steew on 12.08.2021.
//
//

import UIKit
import CoreData

@objc(Movies)
public class Movies: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
    }
    
    required convenience public init(from decoder: Decoder) throws {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Movies", in: context)
        else { fatalError("error") }
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.init(entity: entity, insertInto: context)
        id = try! container?.decode(Int64.self, forKey: .id) ?? 0
        originalTitle = try? container?.decode(String.self, forKey: .originalTitle) ?? ""
        overview = try? container?.decode(String.self, forKey: .overview) ?? ""
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(originalTitle, forKey: .originalTitle)
        try container.encode(overview, forKey: .overview)
    }
    
}
