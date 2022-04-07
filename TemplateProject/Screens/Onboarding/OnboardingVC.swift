//
//  OnboardingVC.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit

class OnboardingVC: BaseVC {
    
    let v = OnboardinView()
    
    override func loadView() {view = v}
    override func viewDidLoad() {
        super.viewDidLoad()
//        Loader.show(title: "Wait", animation: "loading_1")
//        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
//            self.state = ["key":1]
//            Loader.hide()
////            AlertView().show()
//
//        }
        setTarget()
        title = "ScrollView"
    }
    
    func setTarget() {
        v.setTargets(for: .terms, action: #selector(showTerms))
    }
    
    @objc func showTerms() {
//        Reminder.createNotificatication(for: Notifucka(time: Date().addingTimeInterval(5)))
//        state[b: "changeBack"] = true
//        Loader.show(title: "Wait", animation: "loading_1")
//        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
//            self.state = ["key":2]
//            Loader.hide()
//        }
//
//        AlertView().show()
//        v.imageView.desaturateImage(tintColor: .green)
        v.textLabel.animate(to: "foodd")
        NotificationManager.shared.createNotification(with: Notifucka(time: Date(timeIntervalSinceNow: 1), title: "Test again", body: "Hello world Vanes"), userInfo: ["url":"https://ya.ru"])
        
    }
}
