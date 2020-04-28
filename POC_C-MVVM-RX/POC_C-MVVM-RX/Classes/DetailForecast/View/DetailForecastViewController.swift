//
//  DetailForecastViewController.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 28/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class DetailForecastViewController: MVVMController, StoryboardInitializable {
    var viewModel: DetailForecastViewModel!
    private let refreshControl = UIRefreshControl()
    @IBOutlet private var tableView: UITableView!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.sendActions(for: .valueChanged)
    }

    internal override func setupUI() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.insertSubview(refreshControl, at: 0)
    }

    internal override func setupBindings() {
        // View Model outputs to the View Controller

        viewModel.weathers
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
            .bind(to: tableView.rx.items(cellIdentifier: "WeatherCell", cellType: WeatherCell.self)) { [weak self] _, weather, cell in
                self?.setupWeatherCell(cell, weather: weather)
            }
            .disposed(by: disposeBag)

        viewModel.title
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)

        viewModel.alertMessage
            .subscribe(onNext: { [weak self] in self?.presentAlert(message: $0) })
            .disposed(by: disposeBag)

        // View Controller UI actions to the View Model

        refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.reload)
            .disposed(by: disposeBag)
    }

    private func setupWeatherCell(_ cell: WeatherCell, weather: WeatherViewModel) {
        cell.selectionStyle = .none
        cell.setTemperature("\(String(describing: weather.weather.list?.count))")
    }

    private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
