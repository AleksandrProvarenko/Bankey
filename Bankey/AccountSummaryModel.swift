//
//  AccountSummaryModel.swift
//  Bankey
//
//  Created by Alex Provarenko on 01.06.2023.
//

import Foundation

enum AccountType: String {
    case Banking
    case CreditCard
    case Investment
}

struct AccountSummaryModel {
    let accounType: AccountType
    let accountName: String
    let balance: Decimal
    
    var balanceAsAttributeString: NSAttributedString {
        return CurrencyFormater().makeAttributedCurrency(balance)
    }
}
