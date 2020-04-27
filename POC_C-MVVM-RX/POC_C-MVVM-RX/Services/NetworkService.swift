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

enum ServiceError: Error {
    case errorToParse
}

/// A service that knows how to perform requests for static data for the cities and get weather for it.

struct NetworkService {
    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
