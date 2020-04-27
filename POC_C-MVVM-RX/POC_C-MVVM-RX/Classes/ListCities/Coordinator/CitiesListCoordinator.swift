//
//  CitiesListCoordinator.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import RxSwift
import SafariServices
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

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return Observable.never()
    }
}
