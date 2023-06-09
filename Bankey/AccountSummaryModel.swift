//
//  AccountSummaryModel.swift
//  Bankey
//
//  Created by Alex Provarenko on 01.06.2023.
//

import Foundation

enum AccountType: String, Codable {
    case Banking
    case CreditCard
    case Investment
}

struct AccountSummaryModel {
    let accounType: AccountType
    let accountName: String
    let balance: Decimal
    
    var balanceAsAttributeString: NSAttributedString {
        return CurrencyFormatter().makeAttributedCurrency(balance)
    }
}
