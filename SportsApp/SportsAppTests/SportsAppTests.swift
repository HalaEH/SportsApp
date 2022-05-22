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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    //All Sports
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
    
    //All Leagues
    func testFetchLeaguesFromRemote(){
         let expectationOject = expectation(description: "Waiting for the response")
        NetworkService.getAllLeagues(sport: "Soccer"){ (result, error)  -> Void in
        
            guard let leagues = (result as? AllLeagues)?.countries else{
                 XCTFail()
                 expectationOject.fulfill()
                 return
             }
           print("leagues count : \(leagues.count)")
             XCTAssertEqual(leagues.count, 10, "error in API items' count")
             expectationOject.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
        
    //All teams
    func testFetchTeamsFromRemote(){
          let expectationOject = expectation(description: "Waiting for the response")
        NetworkService.getAllTeams(leagueName: "English%20Premier%20League"){ (result, error)  -> Void in
        
            guard let teams = (result as? TeamDetails)?.teams else{
                  XCTFail()
                  expectationOject.fulfill()
                  return
              }
            print("number of teams = \(teams.count)")
              XCTAssertEqual(teams.count, 20, "error in API items' count")
              expectationOject.fulfill()
         }
         waitForExpectations(timeout: 15, handler: nil)
     }
    
    
     //League Details (Events)
       func testFetchLeagueDetailsFromRemote(){
             let expectationOject = expectation(description: "Waiting for the response")
        NetworkService.getLeagueDetails(endPoint: .leagueDetails(league: "4328", sport: "Soccer")){ (result, error)  -> Void in
            guard let events = (result as? LeagueDetails)?.events else{
                     XCTFail()
                     expectationOject.fulfill()
                     return
                 }
               print("number of events = \(events.count)")
                 XCTAssertEqual(events.count, 100, "error in API items' count")
                 expectationOject.fulfill()
            }
            waitForExpectations(timeout: 15, handler: nil)
        }
    
    


}
