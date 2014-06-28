//
//  SubjectTest.swift
//  Turbo Octo Hipster
//
//  Created by Livio Bieri on 25/06/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import XCTest
import Turbo_Octo_Hipster

class SubjectTest: XCTestCase {
    
    var objectUnderTest: SubjectProtocol! = nil

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        objectUnderTest = Subject(abbreviation: "mada", directory: "~/Desktop/")
        
        XCTAssertEqual(objectUnderTest.abbreviation, "mada")
        XCTAssertEqual(objectUnderTest.directory, "~/Desktop/")
    }
}
