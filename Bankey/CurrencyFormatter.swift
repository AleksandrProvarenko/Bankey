//
//  CurrencyFormater.swift
//  Bankey
//
//  Created by Alex Provarenko on 02.06.2023.
//

import UIKit

struct CurrencyFormatter {
    
    func makeAttributedCurrency(_ ammount: Decimal) -> NSMutableAttributedString {
        let tuple = breakIntoDollarsAndCents(ammount)
        return makeBalanceAttribute(dollars: tuple.0, cents: tuple.1)
    }
    
    func breakIntoDollarsAndCents(_ amount: Decimal) -> (String, String) {
        let tuple = modf(amount.doubleVaue)
        let dollars = convertDollar(tuple.0)
        let cents = convertCents(tuple.1)
        
        return(dollars, cents)
    }
    
    private func convertDollar(_ dollarPart: Double) -> String {
        let dollarsWidthDecimal = dollarsFormated(dollarPart)
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        let decimalSeparator = formatter.decimalSeparator!
        let dollarComponents = dollarsWidthDecimal.components(separatedBy: decimalSeparator)
        var dollars = dollarComponents.first!
        dollars.removeFirst()
        
        return dollars
    }
    
    func convertCents(_ centPart: Double) -> String {
        let cents: String
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%0.2f", centPart * 100)
        }
        
        return cents
    }
    
    func dollarsFormated(_ dollars: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: dollars as NSNumber) {
            return result
        }
        
        return ""
    }
    
    private func makeBalanceAttribute(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSMutableAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSMutableAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}
