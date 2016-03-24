//
//  AppDelegate.swift
//  motion
//
//  Created by judywu on 12/19/15.
//  Copyright © 2015 CASPIR. All rights reserved.
//

//import UIKit
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//
//
//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
//
//    func applicationWillResignActive(application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//    }
//
//    func applicationDidEnterBackground(application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//
//    func applicationWillEnterForeground(application: UIApplication) {
//        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//    }
//
//    func applicationDidBecomeActive(application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
//
//    func applicationWillTerminate(application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }
//
//
//}

import UIKit
import CoreData
import ResearchKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let healthStore = HKHealthStore()
    
    var window: UIWindow?
    
    var containerViewController: ResearchContainerViewController? {
        return window?.rootViewController as? ResearchContainerViewController
    }
    
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        let standardDefaults = NSUserDefaults.standardUserDefaults()
        if standardDefaults.objectForKey("CASMotionFirstRun") == nil {
            ORKPasscodeViewController.removePasscodeFromKeychain()
            standardDefaults.setValue("CASMotionFirstRun", forKey: "CASMotionFirstRun")
        }
        
        // Appearance customization
        let pageControlAppearance = UIPageControl.appearance()
        pageControlAppearance.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControlAppearance.currentPageIndicatorTintColor = UIColor.blackColor()
        
        // Dependency injection.
        containerViewController?.injectHealthStore(healthStore)
        return true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        lockApp()
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        if ORKPasscodeViewController.isPasscodeStoredInKeychain() {
            // Hide content so it doesn't appear in the app switcher.
            containerViewController?.contentHidden = true
        }
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        lockApp()
    }
    
    func lockApp() {
        /*
        Only lock the app if there is a stored passcode and a passcode
        controller isn't already being shown.
        */
        guard ORKPasscodeViewController.isPasscodeStoredInKeychain() && !(containerViewController?.presentedViewController is ORKPasscodeViewController) else { return }
        
        window?.makeKeyAndVisible()
        
        let passcodeViewController = ORKPasscodeViewController.passcodeAuthenticationViewControllerWithText("Welcome back to CASPIR MOTION ResearchKit App", delegate: self) as! ORKPasscodeViewController
        containerViewController?.presentViewController(passcodeViewController, animated: false, completion: nil)
    }
    
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count - 1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("CASTaskResultModel", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("motion.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "co.motion.errors", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            
        }
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
}

extension AppDelegate: ORKPasscodeDelegate {
    func passcodeViewControllerDidFinishWithSuccess(viewController: UIViewController) {
        containerViewController?.contentHidden = false
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func passcodeViewControllerDidFailAuthentication(viewController: UIViewController) {
    }
}


