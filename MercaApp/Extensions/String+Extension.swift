//
//  String+Extension.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 14/05/22.
//

import Foundation

extension String {
    public func replacingLastOccurrenceOfString(_ string: String,
                                         with substring: String,
                                         caseInsensitive: Bool = true) -> String {
        let options: String.CompareOptions
        if caseInsensitive {
            options = [.backwards, .caseInsensitive]
        } else {
            options = [.backwards]
        }
        if let range = self.range(of: string,
                                  options: options,
                                  range: nil,
                                  locale: nil) {
            return self.replacingCharacters(in: range, with: substring)
        }
        return self
    }
}
