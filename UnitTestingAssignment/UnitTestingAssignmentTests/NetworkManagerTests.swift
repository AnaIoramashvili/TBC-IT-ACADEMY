//
//  NetworkManagerTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Ana on 5/13/24.
//

import XCTest
@testable import UnitTestingAssignment
 
final class NetworkManagerTests: XCTestCase {
 
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager.shared
    }
    
    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }
    
    func testFetchProducts() {
        let expectation = self.expectation(description: "Fetch products")
        
        networkManager.fetchProducts { result in
            switch result {
            case .success(let products):
                XCTAssertNotNil(products, "The products received should not be nil upon success")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Failed to fetch products. Error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 15, handler: nil)
    }
}
