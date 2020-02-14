//
//  weatherModel.swift
//  Clima
//
//  Created by Nitin Birdi on 27/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct modelWeather {
    let tempreature: Double
    let conditionId: Int
    let cityName: String
    
    var tempString: String {
        return String(format: "%.1f", tempreature)
        
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        default:
            return "cloudy"
        }
    }
}
