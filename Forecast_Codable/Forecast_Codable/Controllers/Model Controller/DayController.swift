//
//  DayController.swift
//  Forecast_Codable
//
//  Created by Chase on 2/27/23.
//

import Foundation

class DayController {
    
    static func fetchDays(completion: @escaping (TopLevelDictionary?) -> Void) {
        
        // STRUCT YOUR FINAL URL
        //https://api.weatherbit.io/v2.0/forecast/daily?key=YOURKEY&city=YOURCITY
        
        guard let baseURL = URL(string: Constants.WeatherURL.baseURL) else { completion(nil) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let apiKey = URLQueryItem(name: Constants.WeatherURL.queryKey, value: Constants.WeatherURL.queryValue)
        let cityQuery = URLQueryItem(name: Constants.WeatherURL.cityQueryKey, value: Constants.WeatherURL.cityQueryValue)
        let unitQuery = URLQueryItem(name: Constants.WeatherURL.unitKey, value: Constants.WeatherURL.unitValue)
        urlComponents?.queryItems = [apiKey, cityQuery, unitQuery]
        
        guard let finalURL = urlComponents?.url else { completion(nil) ; return }
        print("Final URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { dayData, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = dayData else { print("There was an error recieving the data") ; completion(nil) ; return }
                
            do {
                
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                completion(topLevelDictionary)
            } catch {
                print(error.localizedDescription)
                completion(nil) ; return
            }
        } .resume()
    }
}
