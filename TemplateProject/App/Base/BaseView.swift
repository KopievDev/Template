//
//  BaseView.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit

protocol State: UIView {
    var state: [String: Any] {get set}
    func render()
}

class BaseView: UIView, State {
    //MARK: - Properies
    var state: [String : Any] = [:]

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        createConstraints()
    }
    
    // MARK: - Helpers
    
    ///Первоначальная настройка интерфейса
    func setUp() {
        backgroundColor = .systemBackground
    }
    
    func createConstraints() {
      
    }
    
    ///Вызывается при изменении переменной `state`
    func render() {}

}

