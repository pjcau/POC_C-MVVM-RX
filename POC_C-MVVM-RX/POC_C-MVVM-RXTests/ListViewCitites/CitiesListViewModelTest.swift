//
//  CitiesListViewModelTest.swift
//  POC_C-MVVM-RXTests
//
//  Created by Pierre jonny cau on 22/05/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

@testable import POC_C_MVVM_RX
import RxSwift
import RxTest
import XCTest

class CitiesListViewModelTest: XCTestCase {
    private var testScheduler: TestScheduler!
    private var disposeBag: DisposeBag!
    private var dataService: DataServiceMock!
    private var viewModel: CitiesListViewModel!
    private var cityVM: CityViewModel = CityViewModel(city: Location(name: "Rome"))

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        testScheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        dataService = DataServiceMock()
        viewModel = CitiesListViewModel(dataService: DataServiceMock())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Init_EmitsValidTitle() {
        let result = testScheduler.start { self.viewModel.title }
        XCTAssertEqual(result.events, [.next(200, "Weather Cities"), .completed(200)])
    }

    func test_Init_SendsValidCities() {
        let result = testScheduler.start { self.viewModel.cities }
        XCTAssertEqual(result.events, [.next(200, [cityVM]), .completed(200)])
    }

    func test_Init_ShowDetailForecast() {
        let result = testScheduler.start { self.viewModel.showDetailForecast }
        XCTAssertEqual(result.events, [])
    }

    func test_Next_ShowValidCities() {
        let result = testScheduler.start { self.viewModel.cities }
        XCTAssertEqual(result.events.count, 2)

        guard let repositoryViewModel = result.events.first?.value.element?.first else {
            return XCTFail()
        }

        XCTAssertEqual(repositoryViewModel.name, "Rome")
    }

    func test_Next_ShowDetailForecast() {
        let cityToSelect = cityVM
        let selectRepositoryObservable = testScheduler.createHotObservable([.next(300, cityToSelect)])

        selectRepositoryObservable
            .bind(to: viewModel.selectCity)
            .disposed(by: disposeBag)

        let result = testScheduler.start { self.viewModel.showDetailForecast }
        XCTAssertEqual(result.events, [Recorded.next(300, "Rome")])
    }
}
