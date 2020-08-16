//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Vanoshan  Ramdhani on 2020/08/09.
//  Copyright © 2020 Vanoshan  Ramdhani. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         window = UIWindow(frame: UIScreen.main.bounds)
        let weather = WeatherViewCOntroller()
        window?.rootViewController = weather
        window!.makeKeyAndVisible()
        return true
    }

}

