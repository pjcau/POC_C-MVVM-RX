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
    func ourFormat() -> String {
        let theCalendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let time = dateFormatter.string(from: self).capitalized

        func calcComponent(day: Int) -> DateComponents {
            var dayComponent = DateComponents()
            dayComponent.day = day
            return dayComponent
        }

        func calculateMidNight() -> Date {
            let now = Date()
            let calendar = Calendar.current
            let dateComponents = DateComponents(calendar: calendar,
                                                year: calendar.component(.year, from: now),
                                                month: calendar.component(.month, from: now),
                                                day: calendar.component(.day, from: now),
                                                hour: 0, minute: 0, second: 0)
            return calendar.date(from: dateComponents)!
        }

        let midnightOfToday = calculateMidNight()

        let tomorrow = theCalendar.date(byAdding: calcComponent(day: 1), to: midnightOfToday)!

        let nextTomorrow = theCalendar.date(byAdding: calcComponent(day: 2), to: midnightOfToday)!

        let twoNextTomorrow = theCalendar.date(byAdding: calcComponent(day: 3), to: midnightOfToday)!

        let threeNextTomorrow = theCalendar.date(byAdding: calcComponent(day: 4), to: midnightOfToday)!

        if (midnightOfToday ... tomorrow).contains(self) {
            return "Today - \(time)"
        } else if (tomorrow ... nextTomorrow).contains(self) {
            return "Tomorrow - \(time)"
        } else if (nextTomorrow ... twoNextTomorrow).contains(self) {
            return "Day after Tomorrow - \(time)"
        } else if (twoNextTomorrow ... threeNextTomorrow).contains(self) {
            return "Next Day after Tomorrow - \(time)"
        } else {
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
