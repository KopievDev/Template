//
//  UIButton.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit

extension UIButton {
    
    @objc public func animateIn(view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    @objc public func animateOut(view viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn) {
            viewToAnimate.transform = .identity
        }
    }
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateIn(view:)), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateOut(view:)), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

}

extension String {
    func add(attributs params: (UIFont, UIColor)) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
            attributedString.append(
                NSMutableAttributedString(string: self,
                                          attributes:
                                            [NSAttributedString.Key.font :params.0,
                                             NSAttributedString.Key.foregroundColor : params.1]))
        return attributedString
    }
}

extension NSMutableAttributedString {
    static func + (lhs:NSMutableAttributedString, rhs:NSMutableAttributedString ) -> NSMutableAttributedString {
        lhs.append(rhs)
        return lhs
    }
}
