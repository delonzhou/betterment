//
//  ratingUITest.swift
//  betterment
//
//  Created by Mitul Manish on 10/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import XCTest

class ratingUITest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        
        //taking app to rating screen
        app.tables.element.cells.elementBoundByIndex(4).tap()
        //app.tables.cells.staticTexts["Mitul Manish"].tap()
        
        
        // check number of buttons equals to 4
        XCTAssertEqual(app.buttons.count, 4)
        
        //tap rating button
        app.buttons.elementBoundByIndex(2).tap()
        //app.buttons["star filled"].tap()
        
        // tap sad button
        let sadButton = app.buttons["Sad"]
        XCTAssertTrue(sadButton.exists)
        sadButton.tap()
        
        //check if rating button does not exists
        XCTAssertFalse(app.buttons["star filled"].exists)
    }
    
}
