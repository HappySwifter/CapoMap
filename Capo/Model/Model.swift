//
//  User+CoreDataClass.swift
//  
//
//  Created by Артем Валиев on 12/12/2018.
//
//

import Foundation
import CoreData

func getObjects<T: NSManagedObject>(withId id: Int? = nil,
                                    limit: Int? = nil,
                                    sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {

    let fetchRequest = NSFetchRequest<T>(entityName: T.description())
    if let limit = limit {
        fetchRequest.fetchLimit = limit
    }
    fetchRequest.sortDescriptors = sortDescriptors
    
    if let id = id {
        let predicate = NSPredicate(format: "id = %i", id)
        fetchRequest.predicate = predicate
    }
    do {
        let result = try context.fetch(fetchRequest)
        return result
        
    } catch {
        Log("Error \(error.localizedDescription)", type: .error)
        return []
    }
}

