//
//  prototypeChattyFoodsUITests.swift
//  prototypeChattyFoodsUITests
//
//  Created by Kate Roberts on 05/04/2020.
//  Copyright © 2020 Kate Roberts. All rights reserved.
//

import XCTest

class prototypeChattyFoodsUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        snapshot("ChooseCharacter")
        app.buttons["Play as this character"].tap()
        snapshot("ChooseFriends")
        app.buttons["See your news feed"].tap()
        snapshot("MainFeed")
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.swipeUp()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Post something"].tap()
        tabBarsQuery.buttons["Your Liked Posts"].tap()
        tabBarsQuery.buttons["Your Feed"].tap()
        scrollViewsQuery.children(matching: .other).element(boundBy: 2).buttons["heart"].tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
