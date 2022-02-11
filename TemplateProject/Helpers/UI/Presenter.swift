//
//  Presenter.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit

protocol Presenter {
    static func show()
}

extension Presenter where Self: UIViewController {
    static func show() {
        guard let topVC = UIApplication.getTopViewController() else {return}
        let vc = Self()
        vc.modalPresentationStyle = .fullScreen
        topVC.present(vc, animated: true)
    }
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
