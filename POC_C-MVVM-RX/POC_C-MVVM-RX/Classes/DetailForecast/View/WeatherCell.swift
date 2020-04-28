//
//  WeatherCell.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 28/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var currentTemperature: UILabel!
    @IBOutlet var minTLabel: UILabel!
    @IBOutlet var maxTLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!

    func setCurrendDate(_ date: String) {
        dateLabel.text = date
    }

    func setCurrentTemperature(_ temp: String) {
        currentTemperature.text = temp
    }

    func setMinTLabel(_ temp: String) {
        minTLabel.text = temp
    }

    func setMaxTLabel(_ temp: String) {
        maxTLabel.text = temp
    }

    func setPressureLabel(_ pressure: String) {
        pressureLabel.text = pressure
    }

    func setHumidityLabel(_ humidity: String) {
        humidityLabel.text = humidity
    }
}
