//
//  AppDelegate.swift
//  GoogleBooksFinder
//
//  Created by David Jangdal on 2023-03-02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = BookSearchViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

