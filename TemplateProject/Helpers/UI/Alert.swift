//
//  Alert.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 19.02.2022.
//

import UIKit

class AlertView: UIView {
    //MARK: - Properies
    let formView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 20
        v.backgroundColor = .white
        return v
    }()
    
    let blurLayer: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .regular)
        let v = UIVisualEffectView(effect: blur)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        v.alpha = 0
        return v
    }()
    
    var centerYForm = NSLayoutConstraint()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text text text"
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text text text"
        return label
    }()
    
    let mainButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = true
        btn.startAnimatingPressActions()
        btn.setTitle("Ok", for: .normal)
        btn.backgroundColor = .red
        return btn
    }()
    
    let secondButton: UIButton = {
        let btn = UIButton()
         btn.translatesAutoresizingMaskIntoConstraints = true
         btn.startAnimatingPressActions()
         btn.setTitle("NEOK", for: .normal)
        btn.backgroundColor = .red
         return btn
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func setUp() {
        addSubview(blurLayer)
        addSubview(formView)
        formView.addSubview(titleLabel)
        formView.addSubview(messageLabel)
        formView.addSubview(mainButton)
        createConstraints()
    }
    
    func createConstraints() {
        let inset = 12.0
        centerYForm = formView.centerYAnchor.constraint(equalTo: bottomAnchor, constant: 300)
        centerYForm.isActive = true
        NSLayoutConstraint.activate([
            formView.centerXAnchor.constraint(equalTo: centerXAnchor),
            formView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            formView.heightAnchor.constraint(equalTo: formView.widthAnchor, multiplier: 0.6),
            
            titleLabel.topAnchor.constraint(equalTo: formView.topAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -inset),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset),
            messageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            mainButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: inset),
            mainButton.bottomAnchor.constraint(equalTo: formView.bottomAnchor, constant: -inset),
            mainButton.leadingAnchor.constraint(equalTo:formView.leadingAnchor, constant: inset),
            mainButton.trailingAnchor.constraint(equalTo:formView.trailingAnchor, constant: -inset),

//            mainButton.widthAnchor.constraint(equalTo: formView.widthAnchor, multiplier: 0.6),
//            mainButton.heightAnchor.constraint(equalTo: mainButton.widthAnchor, multiplier: 0.3)
            
            
        ])
    }
    
    func centerY(){
        centerYForm.isActive = false
        centerYForm = formView.centerYAnchor.constraint(equalTo: centerYAnchor)
        centerYForm.isActive = true
        UIView.animate(withDuration: 0.7) {self.layoutIfNeeded()}
    }
    
    func downY(){
        centerYForm.isActive = false
        centerYForm = formView.centerYAnchor.constraint(equalTo: bottomAnchor, constant: 400)
        centerYForm.isActive = true
        UIView.animate(withDuration: 0.7) {self.layoutIfNeeded()}
    }
    
    
    public func show() {
        DispatchQueue.main.async {[self] in
            guard let window = UIApplication.shared.windows.first else {return}
            window.addSubview(self)
            window.bringSubviewToFront(self)
            frame = window.frame
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            UIView.animate(withDuration: 0.5) { [self] in blurLayer.alpha = 1} completion: { _ in centerY()}
        }
    }
}

