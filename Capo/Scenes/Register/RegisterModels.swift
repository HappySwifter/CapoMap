//
//  RegisterModels.swift
//  Capo
//
//  Created by Артем Валиев on 12/12/2018.
//  Copyright (c) 2018 Артем Валиев. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Register
{    
    enum CreateUser
    {
        struct Request
        {
            let credentials: Credentials
            let confirmPassword: String
            let phone: String
            let city: String
        }
        
        struct Response
        {
            let credentials: Credentials
        }
        struct ViewModel
        {
            let credentials: Credentials
        }
    }
}
