//
//  ScrollView.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 19.03.2022.
//

import UIKit

class ScrollView: BaseView {
    
    let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
       let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addSubview(contentView)
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    override func setUp() {
        backgroundColor = .white
        addSubview(scrollView)
    }
    
    override func createConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
