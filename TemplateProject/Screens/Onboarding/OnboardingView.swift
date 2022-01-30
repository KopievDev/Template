//
//  OnboardingView.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit


class OnboardinView: BaseView {
    enum Interface {case terms}
    private let termButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.layer.cornerRadius = 28
        button.setTitle("Terms", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.startAnimatingPressActions()
        return button
    }()

    override func setUp() {
        backgroundColor = .blue
        addSubview(termButton)
        createConstraints()
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            termButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            termButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            termButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            termButton.heightAnchor.constraint(equalTo: termButton.widthAnchor, multiplier: 0.4)
        ])
    }
    
    override func render() {
        if state[i: "key"] == 1 {backgroundColor = .green}
        print(state)
    }
    
    public func setTargets(for type: OnboardinView.Interface,
                           target: Any? = self,
                           action: Selector,
                           for controlEvents: UIControl.Event = .touchUpInside) {
        switch type {
        case .terms: termButton.addTarget(target, action: action, for: controlEvents)
            
        }
    }

    
}
