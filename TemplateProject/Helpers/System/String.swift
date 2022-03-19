//
//  String.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 28.02.2022.
//

import Foundation

extension String {
    
    func toURL() -> URL? {
        return URL(string: self)
    }
    
    public func htmlToAttributedString(text: String) -> NSAttributedString! {
        guard let htmlData = text.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
            return NSAttributedString() }
        let htmlString: NSAttributedString?
        do {
            htmlString = try NSAttributedString(data: htmlData, options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch _ {
            htmlString = nil
        }
        
        return htmlString
    }
}
