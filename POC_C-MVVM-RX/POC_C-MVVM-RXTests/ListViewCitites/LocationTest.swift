//
//  LocationTest.swift
//  POC_C-MVVM-RXTests
//
//  Created by Pierre jonny cau on 21/05/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

@testable import POC_C_MVVM_RX
import XCTest

class LocationTest: XCTestCase {
    private let sampleJSON: [String: String] = [
        "name": "location1"
    ]

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_InitFromJSON_AllFieldsAreCorrect() {
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(sampleJSON), let location = try? JSONDecoder().decode(Location.self, from: jsonData) else {
            return XCTFail("Cannot decoder jsonData to location struct")
        }

        XCTAssertEqual(location.name, "location1")
    }

    func test_EqualityForEqualLocation_ReturnsTrue() {
        let local1 = Location(name: "location")
        let local2 = Location(name: "location")

        XCTAssertEqual(local1, local2)
    }
}
