//
//  RxNetworkUITests.swift
//  RxSamplesUITests
//
//  Created by aybek can kaya on 19/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import XCTest

class RxNetworkUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCountriesLoadedSucceed() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Networking with RxSwift"]/*[[".cells.staticTexts[\"Networking with RxSwift\"]",".staticTexts[\"Networking with RxSwift\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(tablesQuery.cells.count > 0 , "There should be lots of countries")
        tablesQuery.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("uru")
        XCTAssert(tablesQuery.cells.count == 1 , "There should be only one Uruguay")
    }
    
    
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
      

    }
    
}
