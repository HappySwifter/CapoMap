//
//  AppDelegate.swift
//  Capo
//
//  Created by Артем Валиев on 09/12/2018.
//  Copyright © 2018 Артем Валиев. All rights reserved.
//

import UIKit
import CoreData
import Apollo
import DrawerController

let context = appDelegate.persistentContainer.viewContext
let appDelegate = (UIApplication.shared.delegate as! AppDelegate)


func clearEntity<T: NSManagedObject>() -> T? {
    let fetchRequest = NSFetchRequest<T>(entityName: T.description())
    do {
        let result = try context.fetch(fetchRequest)
        for obj in result {
            context.delete(obj)
        }
    } catch {
        Log("Error \(error.localizedDescription)", type: .error)
    }
    return nil
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawerController: DrawerController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        apollo.client.cacheKeyForObject = { $0["id"] }

        let centerViewController: UIViewController
        if CurrentUser.getToken() != nil {
            let contr = getController(forName: UserProfileViewController.self)
            let nav = UINavigationController(rootViewController: contr)
            centerViewController = nav
        } else {
            let contr = getController(forName: LoginViewController.self, showMenuButton: false)
            let nav = UINavigationController(rootViewController: contr)
            centerViewController = nav
            
        }
        
        let menuViewController = getController(forName: MenuViewController.self, showMenuButton: false)
        let menuNav = UINavigationController(rootViewController: menuViewController)
        
        self.drawerController = DrawerController(centerViewController: centerViewController, leftDrawerViewController: menuNav)
        
        self.drawerController?.maximumRightDrawerWidth = UIScreen.main.bounds.size.width - 75
        self.drawerController?.openDrawerGestureModeMask = .all
        self.drawerController?.closeDrawerGestureModeMask = .all
        self.drawerController?.drawerVisualStateBlock = DrawerVisualState.animatedHamburgerButtonVisualStateBlock
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.drawerController
        
        return true

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Capo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

