//
//  Extensions.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 28/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation
import RxSwift

extension Double {
    func fromKTC() -> String {
        return String(format: "%.2f", self - 273.15) + "°C"
    }
}

extension Date {
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }

    func ourFormat() -> String {
        let diffHours = hours(from: Date())

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let time = dateFormatter.string(from: self).capitalized

        switch diffHours {
        case 0 ... 24:
            return "Today - \(time)"
        case 24 ... 48:
            return "Tomorrow - \(time)"
        case 48 ... 72:
            return "Day after Tomorrow - \(time)"
        case 72 ... 96:
            return "Next Day after Tomorrow - \(time)"
        default:
            return description
        }
    }
}

public protocol OptionalType {
    associatedtype Wrapped

    var optional: Wrapped? { get }
}

extension Optional: OptionalType {
    public var optional: Wrapped? { return self }
}

// Unfortunately the extra type annotations are required, otherwise the compiler gives an incomprehensible error.
extension Observable where Element: OptionalType {
    func ignoreNil() -> Observable<Element.Wrapped> {
        return flatMap { value in
            value.optional.map { Observable<Element.Wrapped>.just($0) } ?? Observable<Element.Wrapped>.empty()
        }
    }
}
