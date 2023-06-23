//
//  AccountSummaryHeaderModel.swift
//  Bankey
//
//  Created by Alex Provarenko on 18.06.2023.
//

import Foundation


struct headerModel {
    let welcomeMessage: String
    let name: String
    let date: Date
    
    var dateFormater: String {
        return date.monthDayYearString.capitalized
    }
}

extension Date {
    static var bankeyDateFormater: DateFormatter {
        let formater = DateFormatter()
        formater.timeZone = TimeZone(abbreviation: "EET")
        return formater
    }
    
    var monthDayYearString: String {
        let dateFormater = Date.bankeyDateFormater
        dateFormater.dateFormat = "MMM d, yyyy"
        return dateFormater.string(from: self)
    }
}
