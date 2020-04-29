//
//  NetworkService.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct ApiCredential {
    static let ApiKey = "21ffad50baecdb4d3615db49354f381c"
}

enum ServiceError: Error {
    case errorToParse
}

/// A service that knows how to perform requests for static data for the cities and get weather for it.

class NetworkService {
    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    /// - Parameter city: City to filter by
    /// - Returns: A struct with info about city
    func getForecast(for city: String) -> Observable<Weather> {
        let encodedCity = city.lowercased().addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(encodedCity)&appid=\(ApiCredential.ApiKey)")!
        return session.rx
            .data(request: URLRequest(url: url))
            .flatMap { data throws -> Observable<Weather> in
                guard let weather = try? Weather(data: data)
                else { return Observable.error(ServiceError.errorToParse) }

                return Observable.just(weather)
            }
    }
}
