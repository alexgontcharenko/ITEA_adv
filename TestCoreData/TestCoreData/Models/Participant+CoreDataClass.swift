//
//  Participant+CoreDataClass.swift
//  TestCoreData
//
//  Created by Steew on 10.08.2021.
//
//

import UIKit
import CoreData

@objc(Participant)
public class Participant: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case name
        case position
    }
    
    required convenience public init(from decoder: Decoder) throws {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Participant", in: context)
        else { fatalError("error") }
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.init(entity: entity, insertInto: context)
        name = try? container?.decode(String.self, forKey: .name) ?? ""
        position = try? container?.decode(String.self, forKey: .position) ?? ""
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(position, forKey: .position)
    }
    
}
