//
//  CitiesListCoordinator.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import RxSwift
import UIKit

class CitiesListCoordinator: BaseCoordinator<Void> {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let viewModel = CitiesListViewModel()

        let viewController = CitiesListViewController.initFromStoryboard()
        let navigationController = AppNavigationController(rootViewController: viewController)

        viewController.viewModel = viewModel

        viewModel.showDetailForecast
            .subscribe(onNext: { [weak self] in
                _ = self?.showDetailForecast(navigation: navigationController, city: $0)
                return
            })
            .disposed(by: disposeBag)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return Observable.never()
    }

    private func showDetailForecast(navigation: UINavigationController, city: String) -> Observable<Void> {
        let detailForecastCoordinator = DetailForecastCoordinator(navigation: navigation, nameOfCity: city)
        return coordinate(to: detailForecastCoordinator)
    }
}
