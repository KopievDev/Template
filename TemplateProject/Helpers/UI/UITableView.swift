//
//  UITableView.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 20.03.2022.
//

import UIKit

protocol IdentifiableCell {
    static var identifier: String { get }
}

extension IdentifiableCell {
    static var identifier: String { String(describing: self) }
}

extension UITableViewCell: IdentifiableCell {}

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func dequeueCell<T: UITableViewCell>(_ : T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Can't dequeue cell with identifier - \(T.identifier)")
        }
        return cell
    }
}
