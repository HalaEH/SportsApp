//
//  NetworkMocking.swift
//  SportsAppTests
//
//  Created by Muhammad Kholif on 5/21/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import XCTest
import SportsApp
class NetworkMocking: XCTestCase {
    
    let myMock = MockNetworkManager(shouldReturnError: false)


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchSportsList(){
        myMock.getSports(urlID: 0, paramerters: [:]) { (sports, error, isNull) in
            guard let sports = (sports as? AllSports)?.sports else{
                XCTFail()
                return
            }
            XCTAssertEqual(sports.count, 30, "failed")
        }
    }


}
