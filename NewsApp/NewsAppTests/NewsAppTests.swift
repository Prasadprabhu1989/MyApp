//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Prasad D Prabhu on 04/02/20.
//  Copyright © 2020 Prasad D Prabhu. All rights reserved.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    
    func testNews(){
        let a = 10
     
        XCTAssertTrue(a == 10)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
