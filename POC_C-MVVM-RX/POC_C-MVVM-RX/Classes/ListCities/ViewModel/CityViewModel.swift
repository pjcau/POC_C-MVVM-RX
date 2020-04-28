//
//  CityViewModel.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation

struct CityViewModel {
    let name: String

    init(city: Location) {
        name = city.name
    }
}
