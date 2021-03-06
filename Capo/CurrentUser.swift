//
//  CurrentUser.swift
//  SmartContrakt
//
//  Created by Артем Валиев on 25/11/2018.
//  Copyright © 2018 Артем Валиев. All rights reserved.
//

import Foundation
import UIKit



struct CurrentUser {
    static func getUser() -> User? {
        let def = UserDefaults.standard
        if let _ = def.string(forKey: "current_user_token_key"), let userId = def.object(forKey: "current_user_id_key") as? NSNumber {
            let user: [User] = getObjects(withId: userId.intValue, limit: nil, sortDescriptors: nil)
            return user.first
        } else {
            return nil
        }
    }

    static func getToken() -> String? {
        let def = UserDefaults.standard
        if let token = def.string(forKey: "current_user_token_key") {
            return token
        } else {
            return nil
        }
    }
    
    static func save(user: User, token: String) {
        let def = UserDefaults.standard
        def.set(token, forKey: "current_user_token_key")
        def.set(user.id, forKey: "current_user_id_key")
        def.synchronize()
    }
    
    
    static func removeData() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "current_user_token_key")
        def.removeObject(forKey: "current_user_id_key")
        def.synchronize()
    }
}
