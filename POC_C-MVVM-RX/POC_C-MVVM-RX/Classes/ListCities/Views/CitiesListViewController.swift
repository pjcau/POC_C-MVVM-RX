//
//  CitiesListViewController.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

/// Shows a list of cities
class CitiesListViewController: MVVMController, StoryboardInitializable {
    @IBOutlet private var tableView: UITableView!

    var viewModel: CitiesListViewModel!

    private let disposeBag = DisposeBag()

    internal override func setupUI() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
    }

    internal override func setupBindings() {
        // View Model outputs to the View Controller
        viewModel.cities
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "CityViewCell", cellType: CityViewCell.self)) { [weak self] _, city, cell in
                self?.setupCityCell(cell, city: city)
            }
            .disposed(by: disposeBag)

        viewModel.title
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)

        tableView.rx.modelSelected(CityViewModel.self)
            .bind(to: viewModel.selectCity)
            .disposed(by: disposeBag)
    }

    private func setupCityCell(_ cell: CityViewCell, city: CityViewModel) {
        cell.selectionStyle = .none
        cell.setCity(city.name)
    }

    deinit {
        print("Deinit \(self)")
    }
}
