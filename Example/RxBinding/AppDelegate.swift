//
//  AppDelegate.swift
//  RxBinding
//
//  Created by Meng Li on 03/14/2019.
//  Copyright (c) 2019 MuShare. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ViewController(viewModel: ViewModel())
        window?.makeKeyAndVisible()
        return true
    }

}

