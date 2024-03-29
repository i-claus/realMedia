//
//  AppDelegate.swift
//  RealMovies
//
//  Created by Claudio Vega on 2/22/19.
//  Copyright © 2019 Claudio Vega. All rights reserved.
//

import UIKit
import AFNetworking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let naviCtrl = storyboard.instantiateViewController(withIdentifier: "moviesNavigationCtrl") as! UINavigationController
        let playView = naviCtrl.topViewController as! MoviesViewController
        
        playView.title = "Popular"
        playView.endpoint = "now_playing"
        naviCtrl.tabBarItem.image = #imageLiteral(resourceName: "Film")
        
        let topRatedNavigationCtrl = storyboard.instantiateViewController(withIdentifier: "moviesNavigationCtrl") as! UINavigationController
        let topRatedVC = topRatedNavigationCtrl.topViewController as! MoviesViewController
        topRatedVC.endpoint = "top_rated"
        topRatedVC.title = "Top Rated"
        topRatedNavigationCtrl.tabBarItem.image = #imageLiteral(resourceName: "Star")
        
        let tabBarCtrl = UITabBarController()
        tabBarCtrl.viewControllers = [naviCtrl, topRatedNavigationCtrl]
        
        window?.rootViewController = tabBarCtrl
        window?.makeKeyAndVisible()
        
        UITabBar.appearance().barTintColor = UIColor(red: 0, green: 0.098, blue: 0.0784, alpha: 1.0)
        UITabBar.appearance().tintColor = UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

