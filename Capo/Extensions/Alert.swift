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
    let alert = UIAlertController(title: title, message: title, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "ОК", style: .default) { (action) in
        okCB?()
    }
    alert.addAction(okAction)
    topMostViewController()?.present(alert, animated: true, completion: nil)

}

@discardableResult func presentGraph(errors: [GraphQLError]?, from: String = #function) -> Bool {
    if let errors = errors {
        let message = errors.reduce("", { $0 + $1.description + "..." })
        Log("\(from):: \(message)", type: .error)
        showAlert(title: message) {}
        // print(errors.first?.locations ?? "")
        return true
    } else {
        return false
    }
}


