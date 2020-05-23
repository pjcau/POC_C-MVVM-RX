//
//  CitiesListViewModel.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation
import RxSwift

struct CitiesListViewModel {
    // MARK: - Inputs

    /// Call to open repository page.
    let selectCity: AnyObserver<CityViewModel>

    // MARK: - Outputs

    /// Emits an array of fetched repositories.
    let cities: Observable<[CityViewModel]>

    /// Emits a formatted title for a navigation item.
    let title: Observable<String>

    /// Emits an string of city selected
    let showDetailForecast: Observable<String>

    init(dataService: DataServiceble = DataService()) {
        title = Observable.just("Weather Cities")

        cities = dataService.getCities()
            .map { cities in cities.map(Location.init) }
            .map { cities in cities.map(CityViewModel.init) }

        let selectCity = PublishSubject<CityViewModel>()
        self.selectCity = selectCity.asObserver()

        showDetailForecast = selectCity.asObservable()
            .map { $0.name }
    }
}
