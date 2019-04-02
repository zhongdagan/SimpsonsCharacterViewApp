//
//  SimpsonsCharacterViewerTests.swift
//  SimpsonsCharacterViewerTests
//
//  Created by Dylan Tan on 3/29/19.
//  Copyright © 2019 Dylan. All rights reserved.
//

import XCTest
import Alamofire
@testable import SimpsonsCharacterViewer

class SimpsonsCharacterViewerTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testSingletonAPIHandler() {
        
        let object1 = APIHandler.sharedInstance
        let object2 = APIHandler.sharedInstance
        let otherReferenceToMyFirstObject = object2
        
        XCTAssert(object1 === otherReferenceToMyFirstObject) // passes
    }
    
    func testWebServiseCall(){
        
        let expect = expectation(description: "Check Web service call response from server.")
        if let url = URL(string: AppConfiguration.urlString) {
            Alamofire.request(url).responseJSON { (response) in
                XCTAssertNil(response.error, (response.error?.localizedDescription)!)
                XCTAssertNotNil(response.result, "Json parse failed.")
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, (error?.localizedDescription)!)
        }
    }
    
    func testFirstItemInTheArray(){
        let expect = expectation(description: "Check the value of the first item in the array")
        APIHandler.sharedInstance.fetchUsers { (data, error) in
            XCTAssertNil(error, "Unexpected error occured: \(String(describing: error?.localizedDescription))")
            XCTAssertEqual((data[0].title)!, "Apu Nahasapeemapetilon")
            expect.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, (error?.localizedDescription)!)
        }
    }

}
