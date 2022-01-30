//
//  BaseVC.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit

class BaseVC: UIViewController {
    
    var stateView: State! { return self.view as? State }
    
    private var _state : [String: Any] = [:]
    public var state : [String: Any] {
        get { _state}
        set {
            _state = newValue
            stateView.state = newValue
            stateView.render()
        }
    }
    
    
    @objc func returnFromVC() {
        if let navigationController = navigationController
        {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil);
        }
    }
}
