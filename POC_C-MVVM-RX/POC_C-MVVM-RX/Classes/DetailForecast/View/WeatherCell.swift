//
//  WeatherCell.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 28/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet private var temperatureLabel: UILabel!

    func setTemperature(_ name: String) {
        temperatureLabel.text = name
    }
}
