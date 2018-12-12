//
//  Utils.swift
//  SSS
//
//  Created by Артем Валиев on 04.06.17.
//  Copyright © 2017 Артем Валиев. All rights reserved.
//

import Foundation
import UIKit
import Apollo


func showAlert(title: String, okCB: (() -> Void)?) {
    let alert = UIAlertController(title: "Ошибка", message: title, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "ОК", style: .default) { (action) in
        okCB?()
    }
    alert.addAction(okAction)
    topMostViewController()?.present(alert, animated: true, completion: nil)

}

@discardableResult func presentGraph(errors: [GraphQLError]?, error: Error?, from: String = #function) -> Bool {
    var hasError = false
    if let error = error {
        showAlert(title: error.localizedDescription) { }
        hasError = true
    }
    if let errors = errors {
        let message = errors.reduce("", { $0 + $1.description + "..." })
        Log("\(from):: \(message)", type: .error)
        showAlert(title: message) {}
        hasError = true
    }
    return hasError
}


