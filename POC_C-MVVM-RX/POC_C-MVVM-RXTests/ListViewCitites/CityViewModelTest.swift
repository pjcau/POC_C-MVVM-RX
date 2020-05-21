//
//  CityViewModelTest.swift
//  POC_C-MVVM-RXTests
//
//  Created by Pierre jonny cau on 21/05/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

@testable import POC_C_MVVM_RX
import XCTest

class CityViewModelTest: XCTestCase {
    private let sampleJSON: [String: Location] = [
        "name": Location(name: "location"),
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
        guard let jsonData = try? encoder.encode(sampleJSON), let viewmodel = try? JSONDecoder().decode(CityViewModel.self, from: jsonData) else {
            return XCTFail()
        }

        XCTAssertEqual(viewmodel.name, "location")
    }

    func test_EqualityForEqualLocation_ReturnsTrue() {
        let cityViewModel1 = CityViewModel(city: Location(name: "location"))
        let cityViewModel2 = CityViewModel(city: Location(name: "location"))

        XCTAssertEqual(cityViewModel1, cityViewModel2)
    }
}
