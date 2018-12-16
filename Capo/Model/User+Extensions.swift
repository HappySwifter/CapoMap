//
//  User+Extensions.swift
//  Capo
//
//  Created by Артем Валиев on 12/12/2018.
//  Copyright © 2018 Артем Валиев. All rights reserved.
//

import Foundation
import CoreData


extension User {
    
    @nonobjc public class func createNew() -> User {
        return NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
    }
    
    class func saveUser(data: UserPayload) -> User {
        let id = data.id
        
        let user: User
        if let u: User = getObjects(withId: id).first {
            user = u
        } else {
            user = User.createNew()
            user.id = id as NSNumber
        }

        user.email = data.email
        user.profileImagePath = data.profileImagePath
        appDelegate.saveContext()
        return user
    }
}
