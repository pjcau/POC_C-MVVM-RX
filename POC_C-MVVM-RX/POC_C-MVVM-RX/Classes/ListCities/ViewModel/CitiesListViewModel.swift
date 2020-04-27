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

    // MARK: - Outputs

    /// Emits an array of fetched repositories.
    let cities: Observable<[CityViewModel]>

    /// Emits a formatted title for a navigation item.
    let title: Observable<String>

    init(dataService: DataService = DataService()) {
        title = Observable.just("Weather Cities")

        cities = dataService.getCities()
            .map { cities in cities.map(City.init) }
            .map { cities in cities.map(CityViewModel.init) }
    }
}
