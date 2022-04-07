//
//  AppDelegate.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NotificationManager.shared.requestAuth()
        NotificationManager.shared.createNotification(with: Notifucka(time: Date(timeIntervalSinceNow: 5), title: "Broo", body: "Hello"))
        return true
    }

}
