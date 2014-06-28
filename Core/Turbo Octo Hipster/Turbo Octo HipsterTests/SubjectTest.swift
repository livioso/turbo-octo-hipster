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
    
    func testInitWithoutTrailingSlash() {
        objectUnderTest = Subject(directory: "~/Desktop", abbreviation: "mada")
        
        XCTAssertEqual(objectUnderTest.abbreviation, "mada")
        XCTAssertEqual(objectUnderTest.directory, "~/Desktop/")
        XCTAssertEqual(objectUnderTest.fullpath, "~/Desktop/mada")
    }

    func testInitWithTrailingSlash() {
        objectUnderTest = Subject(directory: "~/Desktop/", abbreviation: "mada")
        
        XCTAssertEqual(objectUnderTest.abbreviation, "mada")
        XCTAssertEqual(objectUnderTest.directory, "~/Desktop/")
        XCTAssertEqual(objectUnderTest.fullpath, "~/Desktop/mada")
    }
}
