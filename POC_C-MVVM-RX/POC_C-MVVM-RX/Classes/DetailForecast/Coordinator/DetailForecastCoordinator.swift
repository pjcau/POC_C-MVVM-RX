//
//  DetailForecastCoordinator.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import RxSwift
import UIKit

class DetailForecastCoordinator: BaseCoordinator<Void> {
    private let navigation: UINavigationController
    private let nameOfCity: String

    init(navigation: UINavigationController, nameOfCity: String) {
        self.navigation = navigation
        self.nameOfCity = nameOfCity
    }

    override func start() -> Observable<Void> {
        let viewModel = DetailForecastViewModel(city: nameOfCity)

        guard let viewController = DetailForecastViewController.initFromStoryboard() else {
            return Observable.never()
        }

        viewController.viewModel = viewModel

        navigation.pushViewController(viewController, animated: true)

        return Observable.never()
    }
}
