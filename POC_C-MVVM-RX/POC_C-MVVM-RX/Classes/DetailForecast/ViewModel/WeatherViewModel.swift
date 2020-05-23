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

struct CityMetadataViewModel {
    let city: City?

    init(city: City? = nil) {
        self.city = city
    }
}

struct ForecastViewModel {
    let forecast: List?
    let main: MainForecatViewModel
    let currentDate: String

    init(_ list: List? = nil) {
        forecast = list
        if let forecast = forecast, let mainF = forecast.main {
            main = MainForecatViewModel(main: mainF)
        } else {
            main = MainForecatViewModel()
        }

        if let forecast = forecast, let time = forecast.dt {
            let date = Date(timeIntervalSince1970: TimeInterval(time))
            currentDate = date.ourFormat()
        } else {
            currentDate = "0.0 °C"
        }
    }
}

struct MainForecatViewModel {
    private let main: MainClass

    var currentTemperature: String!
    var minTLabel: String!
    var maxTLabel: String!
    var pressureLabel: String!
    var humidityLabel: String!

    init(main: MainClass = MainClass()) {
        self.main = main

        currentTemperature = currentTemperature(main.temp)
        minTLabel = minTemperature(main.tempMin)
        maxTLabel = maxTemperature(main.tempMax)
        pressureLabel = "\(String(describing: main.pressure ?? 0)) hPa"
        humidityLabel = "\(String(describing: main.humidity ?? 0)) %"
    }
}

extension MainForecatViewModel {
    func currentTemperature(_ temp: Double?) -> String {
        return "Temperature -> " + (temp?.fromKTC() ?? "Error °C")
    }

    func minTemperature(_ temp: Double?) -> String {
        return "Min T -> " + (temp?.fromKTC() ?? "Error °C")
    }

    func maxTemperature(_ temp: Double?) -> String {
        return "Max T -> " + (temp?.fromKTC() ?? "Error °C")
    }
}
