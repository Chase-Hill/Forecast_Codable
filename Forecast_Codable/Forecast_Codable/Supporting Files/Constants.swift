//
//  Constants.swift
//  Forecast_Codable
//
//  Created by Chase on 2/27/23.
//

import Foundation

struct Constants {
 //https://api.weatherbit.io/v2.0/forecast/daily?city=Canton,GA&units=I&key=7f758aea21b04fffa5e4030724da616c
    struct WeatherURL {
        
        static let baseURL = "https://api.weatherbit.io/v2.0/forecast/daily"
        static let queryKey = "key"
        static let queryValue = "7f758aea21b04fffa5e4030724da616c"
        static let cityQueryKey = "city"
        static let cityQueryValue = "Canton,GA"
        static let unitKey = "units"
        static let unitValue = "I"
    }
}
