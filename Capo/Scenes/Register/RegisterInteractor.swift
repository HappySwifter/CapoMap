//
//  RegisterInteractor.swift
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

protocol RegisterBusinessLogic
{
    func registerUser(request: Register.CreateUser.Request)
}

protocol RegisterDataStore
{
    //var name: String { get set }
}

class RegisterInteractor: RegisterBusinessLogic, RegisterDataStore
{
    var presenter: RegisterPresentationLogic?
    var worker: RegisterWorker?
    
    // MARK: Do something
    
    func registerUser(request: Register.CreateUser.Request) {
        let mut = RegisterMutation(name: request.credentials.email,
                                   email: request.credentials.email,
                                   password: request.credentials.password)
        apollo.client.perform(mutation: mut) { [weak self] res, error in
            presentGraph(errors: res?.errors, error: error)
            guard let data = res?.data else { return }
            if let email = data.createUser?.email {
                self?.presenter?.presentRegisteringSuccess(response: Register.CreateUser.Response(credentials: request.credentials))
            }
        }
    }
    
}
