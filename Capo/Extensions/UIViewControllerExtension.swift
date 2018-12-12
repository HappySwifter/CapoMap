//
//  UIViewControllerExtension.swift
//  C-Systems
//
//  Created by Доможиров Валерий Александрович on 11.07.17.
//  Copyright © 2017 Joylight Rus Ltd. All rights reserved.
//

import Foundation
import UIKit

/// Returns the current application's top most view controller.
func topMostViewController() -> UIViewController? {
    let rootViewController = appDelegate.drawerController
    return topMostViewControllerOfViewController(rootViewController)
}

/// Returns the top most view controller from given view controller's stack.
func topMostViewControllerOfViewController(_ viewController: UIViewController?) -> UIViewController? {
    // UITabBarController
    if let tabBarController = viewController as? UITabBarController,
        let selectedViewController = tabBarController.selectedViewController {
        return topMostViewControllerOfViewController(selectedViewController)
    }
    
    // UINavigationController
    if let navigationController = viewController as? UINavigationController,
        let visibleViewController = navigationController.visibleViewController {
        return topMostViewControllerOfViewController(visibleViewController)
    }
    
    // presented view controller
    if let presentedViewController = viewController?.presentedViewController {
        return topMostViewControllerOfViewController(presentedViewController)
    }
    
    // child view controller
    for subview in viewController?.view?.subviews ?? [] {
        if let childViewController = subview.next as? UIViewController, childViewController !== viewController {
            return topMostViewControllerOfViewController(childViewController)
        }
    }
    
    return viewController
}

extension UIViewController {

    func appendingNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }

}
