//
//  CityViewModel.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation

struct CityViewModel: Codable {
    let name: String

    init(city: Location) {
        name = city.name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let location = try container.decode(Location.self, forKey: .name)
        name = location.name
    }
}

extension CityViewModel: Equatable {
    static func == (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
        return lhs.name == rhs.name
    }
}
