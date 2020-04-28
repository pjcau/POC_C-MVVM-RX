//
//  DetailForecastViewModel.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 28/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation
import RxSwift

struct DetailForecastViewModel {
    // MARK: - Inputs

    /// Call to reload weather.
    let reload: AnyObserver<Void>

    // MARK: - Outputs

    /// Emits an object of weather.
    let weathers: Observable<[WeatherViewModel]>

    /// Emits a formatted title for a navigation item.
    let title: Observable<String>

    /// Emits an error messages to be shown.
    let alertMessage: Observable<String>

    init(city: String, network: NetworkService = NetworkService()) {
        let _reload = PublishSubject<Void>()
        reload = _reload.asObserver()

        let _city = BehaviorSubject<String>(value: city)

        title = _city.asObservable()
            .map { "\($0)" }

        let _alertMessage = PublishSubject<String>()
        alertMessage = _alertMessage.asObservable()

        weathers = Observable.combineLatest(_reload, _city) { _, city in city }
            .flatMapLatest { city in
                network.getForecast(for: city)
                    .catchError { error in
                        _alertMessage.onNext(error.localizedDescription)
                        return Observable.empty()
                    }
            }
            .map { weathers in weathers.map(WeatherViewModel.init) }
    }
}
