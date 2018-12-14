//
//  Helpers.swift
//  Capomap
//
//  Created by guest2 on 27.01.17.
//  Copyright © 2017 Артем Валиев. All rights reserved.
//

import Foundation
import UIKit
import DrawerController
import SwiftMessages


let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)


let screenBounds = UIScreen.main.bounds

func realSize(_ val: CGFloat) -> CGFloat {
    return ceil(val*screenBounds.width/375) // 375 - ширина iPhone 6, 7
}

func Log(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
    let fileName = (filename as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "", options: .caseInsensitive , range: nil)

    print("[\(fileName): \(line) -> \(function)]  \(message)")
}

enum LogType {
    case info, error, warning
}

func Log(_ message: String = "", type: LogType = .info, filename: String = #file, function: String = #function, line: Int = #line) {
    let fileName = (filename as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "", options: .caseInsensitive , range: nil)
    switch type {
    case .info:
        print("[\(fileName): \(line) -> \(function)]  \(message)")
    case .warning:
        print("👉 [\(fileName): \(line) -> \(function)]  \(message)")
    case .error:
        print("😡 [\(fileName): \(line) -> \(function)]  \(message)")
    }
}



func getVisibleVC() -> UIViewController? {
    return UIApplication.shared.keyWindow?.rootViewController?.children.last
}

func getController<T>(forName name: T.Type, showMenuButton: Bool = true) -> T {
    let contr = UIStoryboard(name: String(describing: name), bundle: Bundle.main)
        .instantiateViewController(withIdentifier: String(describing: name))
    if showMenuButton {
        contr.addMenuButton()
    }
    return contr as! T
}

func showAlert(text: String) {
    let view = MessageView.viewFromNib(layout: .messageView)
    view.iconImageView = nil
    view.iconLabel = nil
    view.bodyLabel = nil
    view.titleLabel?.text = text
    SwiftMessages.show(view: view)
}

func isSaved(_ error: Error?, done: Bool = true) -> Bool {
//    guard done else {
//        showAlert(text: error?.localizedDescription ?? "Неизвестная ошибка сохранения")
//        return false
//    }
    if let error = error as? NSError {
        if error.code == 101 {
            return true
        } else {
            showAlert(text: error.localizedDescription)
            return false
        }
    } else {
        return true
    }
}

func isLoaded(_ error: Error?) -> Bool {
    if let error = error as? NSError {
        if error.code == 101 {
            return true
        } else {
            showAlert(text: error.localizedDescription)
            return false
        }
    } else {
        return true
    }
}

extension UIViewController {

    func setCenter(controller: UIViewController) {
//        if (evo_drawerController?.centerViewController as? UINavigationController)?.topViewController == controller {
//            evo_drawerController?.closeDrawer(animated: true, completion: nil)
//        } else {
            let nav = UINavigationController(rootViewController: controller)
            evo_drawerController?.setCenter(nav, withCloseAnimation: true, completion: nil)
//        }
    }

    func setCenter(controllerName name: UIViewController.Type) {
        
        let contr = getController(forName: name)
        setCenter(controller: contr)
    }

    func push(controllerName: UIViewController.Type) {
        let contr = getController(forName: controllerName)
        self.navigationController?.pushViewController(contr, animated: true)
    }
    
    func push(controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

    
    func addMenuButton() {
        let leftDrawerButton = DrawerBarButtonItem(target: self, action: #selector(self.leftDrawerButtonPress))
        self.navigationItem.setRightBarButton(leftDrawerButton, animated: false)
    }
    
    @objc func leftDrawerButtonPress(sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.right, animated: true, completion: nil)
    }
    
}
