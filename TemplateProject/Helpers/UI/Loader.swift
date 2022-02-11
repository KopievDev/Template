//
//  Loader.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 11.02.2022.
//

import UIKit
import Lottie
/// Индикатор активности
enum Loader {
    /// Показать индикатор
    static func show() {
        DispatchQueue.main.async {
            let loader = LoaderView()
            loader.show()
        }
    }
    
    /// Показать индикатор с текстом
    /// - Parameter title: текст
    static func show(title: String, animation: String = "loading") {
        DispatchQueue.main.async {
            let loader = LoaderView(title: title, animation: animation)
            loader.show()
        }
    }
    
    /// Скрыть индикатор
    static func hide() {
        guard let window = UIApplication.shared.windows.first else {return}
        for view in window.subviews where ((view as? LoaderView) != nil) {
            DispatchQueue.main.async {
                (view as? LoaderView)?.hide()
            }
        }
        
    }
}
private
class LoaderView: UIView {
    
   private let loadingView: AnimationView = {
        let view = AnimationView()
        view.animation = Animation.named("loading")
        view.animationSpeed = 1
        view.alpha = 1
        view.loopMode = .loop
        view.contentMode = .scaleAspectFill
        view.play()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required fileprivate init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    convenience init(title: String) {
        self.init()
        titleLabel.text = title
    }
    
    convenience init(title: String, animation: String) {
        self.init()
        titleLabel.text = title
        loadingView.animation = Animation.named(animation)
        loadingView.play()
    }
    
    private func setUp() {
        backgroundColor = .black.withAlphaComponent(0.4)
        addSubview(titleLabel)
        addSubview(loadingView)
        NSLayoutConstraint.activate([
            
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
            loadingView.heightAnchor.constraint(equalTo: loadingView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 2),
            ])
    }
    public func show() {
        DispatchQueue.main.async {[self] in
            guard let window = UIApplication.shared.windows.first else {return}
            window.addSubview(self)
            window.bringSubviewToFront(self)
            frame = window.frame
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            alpha = 0
            UIView.animate(withDuration: 0.5) { [self] in alpha = 1}
        }
    }
    
    public func hide() {
        if superview != nil {
            UIView.animate(withDuration: 0.3) {
                self.alpha = 0
            } completion: { _ in
                self.removeFromSuperview()
            }
        }
    }
    
    deinit {
        print("Deinit **********")
    }
}
