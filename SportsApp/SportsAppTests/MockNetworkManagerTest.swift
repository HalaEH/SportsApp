//
//  MockNetworkManagerTest.swift
//  SportsAppTests
//
//  Created by Hala Emad on 5/21/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import XCTest
@testable import SportsApp

class MockNetworkManagerTest: XCTestCase {

    let myMock = MockNetworkManager(shouldReturnError: false)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testFetchSports(){
        myMock.getSports(urlID: 0, paramerters: [:]) { (sports, error, isNull) in
            guard let sports = (sports as? AllSports)?.sports else{
                XCTFail()
                return
            }
            XCTAssertEqual(sports.count, 34, "failed")
        }
    }
    /*func testFetchLeagues(){
         myMock.getLeagues(urlID: 0, paramerters: [:]) { (leagues, error, isNull) in
            guard let leagues = (leagues as? AllLeagues)?.countries else{
                 XCTFail()
                 return
             }
             XCTAssertEqual(leagues.count, 10, "failed")
         }
     }*/
}
