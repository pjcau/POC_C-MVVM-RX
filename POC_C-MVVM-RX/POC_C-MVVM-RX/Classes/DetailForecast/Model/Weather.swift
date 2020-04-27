//
//  Forecast.swift
//  POC_C-MVVM-RX
//
//  Created by Pierre jonny cau on 27/04/2020.
//  Copyright © 2020 Pierre Jonny Cau. All rights reserved.
//

import Foundation

// MARK: - Weather

struct Weather: Codable {
    let cod: String?
    let message, cnt: Int?
    let list: [List]?
    let cityWeather: CityWeather?
}

// MARK: Weather convenience initializers and mutators

extension Weather {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Weather.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        cod: String?? = nil,
        message: Int?? = nil,
        cnt: Int?? = nil,
        list: [List]?? = nil,
        cityWeather: CityWeather?? = nil
    ) -> Weather {
        return Weather(
            cod: cod ?? self.cod,
            message: message ?? self.message,
            cnt: cnt ?? self.cnt,
            list: list ?? self.list,
            cityWeather: cityWeather ?? self.cityWeather
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

// MARK: - CityWeather

struct CityWeather: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}

// MARK: CityWeather convenience initializers and mutators

extension CityWeather {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CityWeather.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        coord: Coord?? = nil,
        country: String?? = nil,
        population: Int?? = nil,
        timezone: Int?? = nil,
        sunrise: Int?? = nil,
        sunset: Int?? = nil
    ) -> CityWeather {
        return CityWeather(
            id: id ?? self.id,
            name: name ?? self.name,
            coord: coord ?? self.coord,
            country: country ?? self.country,
            population: population ?? self.population,
            timezone: timezone ?? self.timezone,
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

// MARK: - Coord

struct Coord: Codable {
    let lat, lon: Double?
}

// MARK: Coord convenience initializers and mutators

extension Coord {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Coord.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        lat: Double?? = nil,
        lon: Double?? = nil
    ) -> Coord {
        return Coord(
            lat: lat ?? self.lat,
            lon: lon ?? self.lon
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

// MARK: - List

struct List: Codable {
    let dt: Int?
    let main: MainClass?
    let weather: [WeatherElement]?
    let clouds: Clouds?
    let wind: Wind?
    let sys: Sys?
    let dtTxt: String?
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, sys
        case dtTxt
        case rain
    }
}

// MARK: List convenience initializers and mutators

extension List {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(List.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        dt: Int?? = nil,
        main: MainClass?? = nil,
        weather: [WeatherElement]?? = nil,
        clouds: Clouds?? = nil,
        wind: Wind?? = nil,
        sys: Sys?? = nil,
        dtTxt: String?? = nil,
        rain: Rain?? = nil
    ) -> List {
        return List(
            dt: dt ?? self.dt,
            main: main ?? self.main,
            weather: weather ?? self.weather,
            clouds: clouds ?? self.clouds,
            wind: wind ?? self.wind,
            sys: sys ?? self.sys,
            dtTxt: dtTxt ?? self.dtTxt,
            rain: rain ?? self.rain
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

// MARK: - Clouds

struct Clouds: Codable {
    let all: Int?
}

// MARK: Clouds convenience initializers and mutators

extension Clouds {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Clouds.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        all: Int?? = nil
    ) -> Clouds {
        return Clouds(
            all: all ?? self.all
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

// MARK: - MainClass

struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure
        case seaLevel
        case grndLevel
        case humidity
        case tempKf
    }
}

// MARK: MainClass convenience initializers and mutators

extension MainClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MainClass.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        temp: Double?? = nil,
        feelsLike: Double?? = nil,
        tempMin: Double?? = nil,
        tempMax: Double?? = nil,
        pressure: Int?? = nil,
        seaLevel: Int?? = nil,
        grndLevel: Int?? = nil,
        humidity: Int?? = nil,
        tempKf: Double?? = nil
    ) -> MainClass {
        return MainClass(
            temp: temp ?? self.temp,
            feelsLike: feelsLike ?? self.feelsLike,
            tempMin: tempMin ?? self.tempMin,
            tempMax: tempMax ?? self.tempMax,
            pressure: pressure ?? self.pressure,
            seaLevel: seaLevel ?? self.seaLevel,
            grndLevel: grndLevel ?? self.grndLevel,
            humidity: humidity ?? self.humidity,
            tempKf: tempKf ?? self.tempKf
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

// MARK: - Rain

struct Rain: Codable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H
    }
}

// MARK: Rain convenience initializers and mutators

extension Rain {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Rain.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        the3H: Double?? = nil
    ) -> Rain {
        return Rain(
            the3H: the3H ?? self.the3H
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

// MARK: - Sys

struct Sys: Codable {
    let pod: Pod?
}

// MARK: Sys convenience initializers and mutators

extension Sys {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Sys.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        pod: Pod?? = nil
    ) -> Sys {
        return Sys(
            pod: pod ?? self.pod
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

enum Pod: String, Codable {
    case d
    case n
}

// MARK: - WeatherElement

struct WeatherElement: Codable {
    let id: Int?
    let main: MainEnum?
    let weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription
        case icon
    }
}

// MARK: WeatherElement convenience initializers and mutators

extension WeatherElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeatherElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        main: MainEnum?? = nil,
        weatherDescription: String?? = nil,
        icon: String?? = nil
    ) -> WeatherElement {
        return WeatherElement(
            id: id ?? self.id,
            main: main ?? self.main,
            weatherDescription: weatherDescription ?? self.weatherDescription,
            icon: icon ?? self.icon
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Wind

struct Wind: Codable {
    let speed: Double?
    let deg: Int?
}

// MARK: Wind convenience initializers and mutators

extension Wind {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Wind.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        speed: Double?? = nil,
        deg: Int?? = nil
    ) -> Wind {
        return Wind(
            speed: speed ?? self.speed,
            deg: deg ?? self.deg
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
