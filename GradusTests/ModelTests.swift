//
//  ModelTests.swift
//  Gradus
//
//  Created by Barrett Breshears on 11/5/15.
//  Copyright © 2015 Sledgedev. All rights reserved.
//

import XCTest
import Parse

class ModelTests: XCTestCase {
    
    var user:User!
    var interest: Interest!
    override func setUp() {
        super.setUp()
        /*
        journey = Journey()
        journey.title = "Test title"
        journey.desc = "Test desc"
       
        journey.image = PFFile(data: testFileData)!
        */
         let testFileData = NSData()
        user = User()
        user.interests = [1, 2, 3, 4]
        user.profilePicture = PFFile(data:testFileData)!
        
        interest = Interest()
        interest.name = "Hiking"
        interest.desc = "Enjoying the outdoors"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /*
    func testJouryneyModel(){
        
        XCTAssertEqual(journey.title, "Test title")
        XCTAssertEqual(journey.desc, "Test desc")
        XCTAssertNotNil(journey.image)
        
    }
*/
    
    func testUserModel(){
        XCTAssertNotNil(user.interests)
        XCTAssertNotNil(user.profilePicture)
    }
    
    func testInterestModel(){
        
        XCTAssertEqual(interest.name, "Hiking")
        XCTAssertEqual(interest.desc, "Enjoying the outdoors")
        
    }
}
