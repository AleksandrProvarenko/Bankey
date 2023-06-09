//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Alex Provarenko on 05.06.2023.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let resalts = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(resalts.0, "$929,466")
        XCTAssertEqual(resalts.1, "23")
    }
    
    func testZeroDollarFormatted() throws {
        let results = formatter.dollarsFormated(0.00)
        XCTAssertEqual(results, "$0,00")
    }
    
    func testDollarFormatterdWithCurrencySymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormated(929466.23)
        XCTAssertEqual(result, "\(currencySymbol)929,466.23")
    }
}
