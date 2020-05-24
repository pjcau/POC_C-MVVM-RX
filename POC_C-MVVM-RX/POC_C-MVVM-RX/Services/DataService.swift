//
//  DataService.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation
import RxSwift

protocol DataServiceble {
    func getCities() -> Observable<[String]>
}

struct DataService: DataServiceble {
    /// - Returns: a list of cities.
    func getCities() -> Observable<[String]> {
        // For simplicity we will use a stubbed list of cities.
        return Observable.just([
            "Rome",
            "London",
            "Paris",
            "Vienna",
            "Madrid",
            "Lisbon",
            "Amsterdam",
            "Bern",
            "Athens",
            "Moscow",
            "Berlin",
            "Oslo",
            "Sofia",
            "Dublin",
            "Helsinki"
        ])
    }
}
