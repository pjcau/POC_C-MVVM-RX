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

    /// Emits a list of forecast
    let listWeathers: Observable<[ForecastViewModel]>

    /// Emits a object of weeather
    let weather: Observable<WeatherViewModel>

    /// Emits an object of City Info.
    let cityMetadata: Observable<CityMetadataViewModel>

    /// Emits a formatted title for a navigation item.
    let title: Observable<String>

    /// Emits an error messages to be shown.
    let alertMessage: Observable<String>

    init(city: String, network: NetworkService = NetworkService(), days: Int = 3) {
        let _reload = PublishSubject<Void>()
        reload = _reload.asObserver()

        let _city = BehaviorSubject<String>(value: city)

        title = _city.asObservable()
            .map { "\($0)" }

        let _alertMessage = PublishSubject<String>()
        alertMessage = _alertMessage.asObservable()

        weather = Observable.combineLatest(_reload, _city) { _, city in city }
            .flatMapLatest { city in
                network.getForecast(for: city)
                    .catchError { error in
                        _alertMessage.onNext(error.localizedDescription)
                        return Observable.empty()
                    }
            }

            .map { WeatherViewModel(weather: $0) }

        cityMetadata = weather.map { CityMetadataViewModel(city: $0.weather.city) }

        let checkTime = Int(Date().timeIntervalSince1970) + days * 24 * 3600

        listWeathers = weather
            .map { $0.weather.list }
            .flatMap(ignoreNil)
            .map { $0.filter { ($0.dt ?? -1) < checkTime } }
            .map { list in list.map(ForecastViewModel.init) }
    }
}

func ignoreNil<A>(x: A?) -> Observable<A> {
    return x.map { Observable.just($0) } ?? Observable.empty()
}
