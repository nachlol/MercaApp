//
//  NumberFormmater+Extension.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 14/05/22.
//

import Foundation

extension NumberFormatter {
    public func stringColCurrency (number: NSNumber, localeIdentifier: String) -> String {
        locale = Locale(identifier: localeIdentifier)
        numberStyle = .currencyAccounting
        return  string(from: number)!
    }
}
