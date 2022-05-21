//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by Hala Emad on 5/12/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import XCTest
@testable import SportsApp

class SportsAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAllSportsFromRemote() {
         // Use recording to get started writing UI tests.
         // Use XCTAssert and related functions to verify your tests produce the correct results.
         let myExpectation = expectation(description: "Waiting to fetch data from API")
        NetworkService.getAllSports { (result, error)  -> Void in
            guard let sports = (result as? AllSports)?.sports else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertEqual(sports.count, 34, "Api Elements Wrong Count")
            myExpectation.fulfill()

        }
        waitForExpectations(timeout: 5, handler: nil)

     }


}
