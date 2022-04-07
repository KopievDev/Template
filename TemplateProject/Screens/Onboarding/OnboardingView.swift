//
//  OnboardingView.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit
import Lottie


class OnboardinView: ScrollView, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 10 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueCell(ReusableCell.self, for: indexPath)
        cell.render(data: ["hello" : "world"])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    
    enum Interface {case terms}
    
    private let termButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.layer.cornerRadius = 10
        button.setTitle("Terms", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.startAnimatingPressActions()
        return button
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBoooooBooooo"
        label.isUserInteractionEnabled = true
        label.numberOfLines = 0
        return label
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .bezel
        return tf
    }()

    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "fon"))
//        iv.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let loadingView: AnimationView = {
         let view = AnimationView()
         view.animation = Animation.named("empty")
         view.animationSpeed = 1
         view.alpha = 1
//         view.loopMode = .loop
         view.contentMode = .scaleAspectFill
//         view.play()
         view.backgroundColor = .clear
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(ReusableCell.self)
        return tv
    }()
    
    
    override func setUp() {
        super.setUp()
        contentView.addSubview(textLabel)
        contentView.addSubview(loadingView)
        contentView.addSubview(termButton)
        contentView.addSubview(textField)
        contentView.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        loadingView.play(fromFrame: 0, toFrame: 50, loopMode: .none) { succses in
            if succses {
                self.loadingView.play(fromFrame: 50, toFrame: 150, loopMode: .loop, completion: nil)
            }
        }

//        contentView.addSubview(imageView)
//        textLabel.addGestureRecognizer(BindingGestureReconizer { print("Tap") })
        textLabel.addTapGestureRecognizer {
          print("Hello world") 
        }
    }
    
    override func createConstraints() {
      super.createConstraints()
        NSLayoutConstraint.activate([

            textLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            loadingView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            loadingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            loadingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            loadingView.heightAnchor.constraint(equalToConstant: 150),
            
            termButton.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 20),
            termButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            termButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            termButton.heightAnchor.constraint(equalToConstant: 80),
            
            textField.topAnchor.constraint(equalTo: termButton.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 500)
            
        ])
    }
    
    override func render() {
        if state[i: "key"] == 1 {contentView.backgroundColor = .green}
        print(state)
        if state[b: "changeBack"] {
            contentView.backgroundColor = .red
        }
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

extension UIView {
    
    public func applyMotionEffect(with magnitude: Float = 10) {
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion, yMotion]
        
        addMotionEffect(group)
    }
    
    func addGradientMask() {

        if self.mask != nil {
            self.mask = nil
        }

        let gradientMask = CAGradientLayer()

        gradientMask.frame = self.bounds
        gradientMask.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientMask.locations = [0.75, 1.0]

        let maskView: UIView = UIView()
        maskView.layer.addSublayer(gradientMask)

        self.mask = maskView
    }
    
    func pushTransition(_ duration: CFTimeInterval) {
        
        let animation: CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }

}

extension UILabel {

    func animate(to text: String) {
        UIView.transition(with: self, duration: 0.3, options: [.curveEaseInOut, .transitionCrossDissolve], animations: { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.text = text
        }, completion: nil)
    }
}

extension UIImageView {
    
    func desaturateImage(tintColor: CIColor) {
        
        guard let currentCGImage = image?.cgImage else {
            return
        }
        
        let currentCIImage = CIImage(cgImage: currentCGImage)

        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")

        // set a gray value for the tint color
        filter?.setValue(tintColor, forKey: "inputColor")

        filter?.setValue(1.0, forKey: "inputIntensity")
        
        guard let outputImage = filter?.outputImage else {
            return
        }

        let context = CIContext()

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            image = processedImage
        }
    }
}



public class KeyboardLayoutConstraint: NSLayoutConstraint {
    
    private var offset : CGFloat = 0
    private var keyboardVisibleHeight : CGFloat = 0
    
    @available(tvOS, unavailable)
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        offset = constant
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardLayoutConstraint.keyboardWillShowNotification(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardLayoutConstraint.keyboardWillHideNotification(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Notification
    
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            if let frameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let frame = frameValue.cgRectValue
                keyboardVisibleHeight = frame.size.height
            }
            
            self.updateConstant()
            switch (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber, userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber) {
            case let (.some(duration), .some(curve)):
                
                let options = UIView.AnimationOptions(rawValue: curve.uintValue)
                
                UIView.animate(
                    withDuration: TimeInterval(duration.doubleValue),
                    delay: 0,
                    options: options,
                    animations: {
                        UIApplication.shared.keyWindow?.layoutIfNeeded()
                        return
                    }, completion: { finished in
                })
            default:
                
                break
            }
            
        }
        
    }
    
    @objc func keyboardWillHideNotification(_ notification: NSNotification) {
        keyboardVisibleHeight = 0
        self.updateConstant()
        
        if let userInfo = notification.userInfo {
            
            switch (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber, userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber) {
            case let (.some(duration), .some(curve)):
                
                let options = UIView.AnimationOptions(rawValue: curve.uintValue)
                
                UIView.animate(
                    withDuration: TimeInterval(duration.doubleValue),
                    delay: 0,
                    options: options,
                    animations: {
                        UIApplication.shared.keyWindow?.layoutIfNeeded()
                        return
                    }, completion: { finished in
                })
            default:
                break
            }
        }
    }
    
    func updateConstant() {
        self.constant = offset + keyboardVisibleHeight
    }
    
}



