//
//  DataServiceMock.swift
//  POC_C-MVVM-RXTests
//
//  Created by Pierre jonny cau on 21/05/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

@testable import POC_C_MVVM_RX
import RxSwift
import XCTest

struct DataServiceMock: DataServiceble {
    var citiesListReturnValue: Observable<[String]> = Observable.just(["Rome"])

    func getCities() -> Observable<[String]> {
        return citiesListReturnValue
    }
}
