//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Alex Provarenko on 02.06.2023.
//

import UIKit

extension Decimal {
    var doubleVaue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
