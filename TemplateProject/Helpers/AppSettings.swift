//
//  AppSettings.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import Foundation

final class Settings {
    static let shared = Settings()
    private init() {}
    private var defaults = UserDefaults.standard
    
    private func read<T>(property: String = #function) -> T? {
        defaults.object(forKey: property) as? T
    }
    private func write<T>(value: T,to property: String = #function){
        defaults.setValue(value, forKey: property)
    }
}

extension Settings {
    var appLaunch: Int {
        get{read() ?? 0}
        set{write(value: newValue)}
    }
    
    var isFirstLaunch: Bool {
        get{read() ?? true}
        set{write(value: newValue)}
    }

    
    var showLaunchScreen: Bool {
        get{read() ?? true}
        set{write(value: newValue)}
    }

}
