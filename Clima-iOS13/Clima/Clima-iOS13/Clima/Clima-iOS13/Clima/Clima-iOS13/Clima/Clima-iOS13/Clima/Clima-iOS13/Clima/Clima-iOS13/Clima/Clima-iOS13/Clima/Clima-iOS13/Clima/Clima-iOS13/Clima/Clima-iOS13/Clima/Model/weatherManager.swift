//
//  weatherManager.swift
//  Clima
//
//  Created by Nitin Birdi on 26/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct weatherManager {
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=aa2dc135995e9722da2d1c7ae9dcff7a&units=metric"
    
    func fetchWeather(_ cityName: String) {
        let urlstring = "\(WeatherURL)&q=\(cityName)"
        performString(urlString: urlstring)
        
    }
    
    func performString (urlString: String){
        
        //1.create URL
        if let url = URL(string: urlString) {
            
            //2.create a URLsession
            let session = URLSession(configuration: .default)
            
            //3.give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            //4.start the task
            task.resume()
            
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let CityNaMe = decodedData.name
            let weatherTemp = decodedData.main.temp
            let weatherID = decodedData.weather[0].id
            
            modelWeather(tempreature: weatherTemp, conditionId: weatherID, cityName: CityNaMe)
            
        } catch {
            print(error)
            
        }
    }
}
















    
//    func handle(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//                  print(error!)
//                  return
//
//              }
//
//              if let safeData = data {
//                  let stringData = String(data: safeData, encoding: .utf8)
//                  print(stringData)
//
//              }    }

