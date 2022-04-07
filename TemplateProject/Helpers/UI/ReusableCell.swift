//
//  ReusableCell.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 11.02.2022.
//

import UIKit

protocol Reusable: AnyObject {
    var data: [String : Any?] { get set }
    func render(data: [String:Any?])
}

class ReusableCell: UITableViewCell, Reusable {
    //MARK: - Properies
    var data: [String : Any?] = [:]
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        createConstraints()
    }
    
    
    func render(data: [String:Any?]) {
        print(data)
    }
    
    // MARK: - Helpers
    func setUp() {
        backgroundColor = .white
    }
    
    func createConstraints() {}
}

