//
//  ReusableCell.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 11.02.2022.
//

import UIKit

class ReusableCell: UITableViewCell {
    //MARK: - Properies
    var data: [String : Any?] = [:]
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func render(data: [String:Any?]) {
        
    }
    
    // MARK: - Helpers
    func setUp() {
        backgroundColor = .white
        createConstraints()
    }
    
    func createConstraints() {
        
    }
}

