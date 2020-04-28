//
//  WeatherViewModel.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 28/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    let weather: Weather
    init(weather: Weather) {
        self.weather = weather
    }
}
