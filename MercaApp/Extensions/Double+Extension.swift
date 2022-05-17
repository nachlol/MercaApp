//
//  Double+Extension.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 14/05/22.
//

import Foundation

extension Double {
    public func colCurrency(enableSymbol: Bool = false, fractionDigits: Int = 2, localeIdentifier: String = "es_CO") -> String {
        
        let numberFormater = NumberFormatter()
        numberFormater.minimumFractionDigits = fractionDigits
        numberFormater.maximumFractionDigits = fractionDigits
        numberFormater.currencySymbol = ""
        
        var value = numberFormater.stringColCurrency(number: NSNumber(value: self), localeIdentifier: localeIdentifier)
        
        if fractionDigits > 0 {
            value = value.replacingLastOccurrenceOfString(",", with: ".")
        }
        return "$" + value.trimmingCharacters(in: .whitespaces)
    }
}
