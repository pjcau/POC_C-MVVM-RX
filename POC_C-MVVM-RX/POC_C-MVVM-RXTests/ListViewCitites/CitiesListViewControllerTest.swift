//
//  CitiesListViewControllerTest.swift
//  POC_C-MVVM-RXTests
//
//  Created by Pierre jonny cau on 22/05/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

@testable import POC_C_MVVM_RX
import RxSwift
import RxTest
import XCTest

class CitiesListViewControllerTest: XCTestCase {
    private var testScheduler: TestScheduler!
    private var disposeBag: DisposeBag!

    var viewModel: CitiesListViewModel!

    var controller: CitiesListViewController?

    override func setUpWithError() throws {
        testScheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()

        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: .main)

        controller = storyboard.instantiateViewController(withIdentifier: "CitiesListViewController") as? CitiesListViewController
        viewModel = CitiesListViewModel(dataService: DataServiceMock())

        controller?.viewModel = viewModel

        controller?.loadView()
        controller?.viewDidLoad()

        controller?.beginAppearanceTransition(true, animated: false)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        controller = nil
        controller?.endAppearanceTransition()
    }

    func test_property_check() {
        XCTAssertNotNil(controller?.tableView)
        XCTAssertNotNil(viewModel)
    }

    func test_count_elements_on_tableView() {
        XCTAssertEqual(1, controller?.tableView!.dataSource?.tableView((controller?.tableView)!, numberOfRowsInSection: 0))
    }

    func test_cell_from_tableview() {
        let tableView = controller?.tableView
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView!.dataSource?.tableView(tableView!, cellForRowAt: indexPath) as? CityViewCell
        XCTAssertNotNil(cell)
    }

    func test_label_cell_from_tableview() {
        let tableView = controller?.tableView
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView!.dataSource?.tableView(tableView!, cellForRowAt: indexPath) as? CityViewCell
        XCTAssertEqual("Rome", cell!.nameLabel!.text)
    }
}
