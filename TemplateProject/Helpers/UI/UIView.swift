//
//  UIView.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 20.03.2022.
//

import UIKit

extension UIView {

    private struct AssociatedKeys {
        static var action = "action"
    }

    private typealias Action = (() -> Void)?

    private var action: Action? {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.action) as? Action
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.action, newValue as Any?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    func addTapGestureRecognizer(action: (() -> Void)?) {
        isUserInteractionEnabled = true
        self.action = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        addGestureRecognizer(tapGestureRecognizer)
    }

    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        guard let action = action else { return }
        action?()
    }

}
