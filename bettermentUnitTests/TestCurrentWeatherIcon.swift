//
//  TestCurrentWeatherIcon.swift
//  betterment
//
//  Created by Mitul Manish on 22/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//


import XCTest
@testable import betterment

class TestCurrentWeatherIcon: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCurrentWeatherStatusIcon() {
        let imageIcon = IconFactory(iconName: "clear-day").toImage()
        XCTAssertEqual(UIImage(named: "clear-day.png"), imageIcon, "images are equal")
    }
    
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
