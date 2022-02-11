//
//  Theme.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import UIKit

enum Screen {
    static let width: CGFloat = UIScreen.main.bounds.width
    static let height: CGFloat = UIScreen.main.bounds.height
    static let spacing = height * 0.05
    static let spacingMini = height * 0.025
}

enum Theme {
    //MARK: - Colors
    enum Colors {
        static let red: UIColor = UIColor(red: 1, green: 0.231, blue: 0.188, alpha: 1)
        static let buttonBackground: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        static let lightGray: UIColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        static let darkGray: UIColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        static let gray: UIColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        static let background: UIColor = .white
        static let whiteWithAlpha: UIColor = .white.withAlphaComponent(0.7)
    }
    //MARK: - Fonts
    enum Fonts {
        
        static func light(size: CGFloat) -> UIFont {
            getCustomFont(withName: "HKGrotesk-Light", size: size)
        }
        static func medium(size: CGFloat) -> UIFont {
            getCustomFont(withName: "HKGrotesk-Medium", size: size)
        }
        static func bold(size: CGFloat) -> UIFont {
            getCustomFont(withName: "HKGrotesk-Bold", size: size)
        }
        static func black(size: CGFloat) -> UIFont {
            getCustomFont(withName: "HKGrotesk-Black", size: size)
        }
        
        private static func getCustomFont(withName name: String, size: CGFloat) -> UIFont {
            if let font = UIFont(name: name, size: size){
                return font
            }
            return UIFont.systemFont(ofSize: size)
        }
    }
}
