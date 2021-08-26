//
//  File.swift
//  TestCoreData
//
//  Created by Steew on 10.08.2021.
//

import UIKit
import CoreData

class NetworkManager {
    private var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func fetchParticipants() -> [Participant] {
        var result: [Participant] = []
        do {
            let participants = try appDelegate.persistentContainer.viewContext.fetch(Participant.fetchRequest()) as? [Participant]
            participants?.forEach({ participant in
                print("______")
                print("\(participant.name ?? "")")
                result.append(participant)
            })
        } catch {
            // print(error)
        }
        return result
    }
    
    func saveData(name: String, position: String) {
        let participant = Participant(
            entity: Participant.entity(),
            insertInto: appDelegate.persistentContainer.viewContext
        )
        
        participant.name = name
        participant.position = position
        
        appDelegate.saveContext()
    }
    
}
