//
//  AppDelegate.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder,
                    UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let coordinator = AppCoordinator(navigationController: navigationController)
        coordinator.initialView()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

