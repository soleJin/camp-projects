//
//  Response.swift
//  WeatherForecast
//
//  Created by sole on 2021/01/20.
//

import Foundation

class WeatherAPI {
    let appID: String = "179f9f1734b59fcdd8627cb64e9fae5d"
    
    static func find(_ latitude: Double, _ longitude: Double, completion: @escaping (CurrentWeather) -> Void) {
        let session = URLSession(configuration: .default)
        
        guard var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather?") else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "appid", value: "179f9f1734b59fcdd8627cb64e9fae5d")
        ]
        
        guard let requestURL = urlComponents.url else {
            return
        }
        
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            let successRange = 200..<300
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else { return }
            guard let resultData = data else { return }
            let strings = String(data: resultData, encoding: .utf8)
            print(strings)
        }
        dataTask.resume()
    }
}
