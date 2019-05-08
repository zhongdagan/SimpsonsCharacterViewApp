//
//  SimpsonsCharacterViewerUITests.swift
//  SimpsonsCharacterViewerUITests
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import XCTest

class SimpsonsCharacterViewerUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = true
        XCUIApplication().launch()
    }
    
    func testDetailViewController() {
        let app = XCUIApplication()
        let tableQuerys = app.tables
        tableQuerys.staticTexts["Apu Nahasapeemapetilon"].tap()
        XCTAssertTrue(app.navigationBars["APU NAHASAPEEMAPETILON"].exists, "Didn't go to detail view controller")
    }

}
