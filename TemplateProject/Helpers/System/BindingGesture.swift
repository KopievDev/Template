//
//  BindingGesture.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 19.03.2022.
//

import UIKit

final class BindingGestureReconizer: UITapGestureRecognizer {
    private var action: ()->Void
    
    init(action: @escaping ()->Void) {
        self.action = action
        super.init(target: nil, action: nil)
        self.addTarget(self, action: #selector(execute))
    }
    
    @objc private func execute() {action()}
    
}
