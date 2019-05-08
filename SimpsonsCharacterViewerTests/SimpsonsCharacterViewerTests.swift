//
//  SimpsonsCharacterViewerTests.swift
//  SimpsonsCharacterViewerTests
//
//  Created by Ethan Gan on 5/7/19.
//  Copyright © 2019 Ethan Gan. All rights reserved.
//

import XCTest
import Alamofire
@testable import SimpsonsCharacterViewer

class SimpsonsCharacterViewerTests: XCTestCase {

    func testSingletonAPIHandler() {
        let object1 = APIHandler.sharedInstance
        let object2 = APIHandler.sharedInstance
        let otherReferenceToMyFirstObject = object2
        
        XCTAssert(object1 === otherReferenceToMyFirstObject) // passes
    }
    
    func testWebServiseCall(){
        let expectation = XCTestExpectation(description: "Test API Call From Web service")
        if let url = URL(string: AppConfiguration.urlString) {
            Alamofire.request(url).responseJSON { (response) in
                XCTAssertNil(response.error, "API call failed")
                XCTAssertNotNil(response.result, "Json parse failed.")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetItemsInViewModel() {
        let viewModel = UserViewModel()
        let expectation = XCTestExpectation(description: "Test Get Items")
        viewModel.getItems { error in
            if error == nil {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
