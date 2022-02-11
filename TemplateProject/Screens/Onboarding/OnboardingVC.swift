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
        Loader.show(title: "Wait", animation: "loading_1")
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.state = ["key":1]
            Loader.hide()
        }
        setTarget()
        
    }
    
    func setTarget() {
        v.setTargets(for: .terms, action: #selector(showTerms))
    }
    
    @objc func showTerms() {
        Reminder.createNotificatication(for: Notifucka(time: Date().addingTimeInterval(5)))
        state[b: "changeBack"] = true
        Loader.show(title: "Wait", animation: "loading_1")
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.state = ["key":2]
            Loader.hide()
        }
        
    }
}
