//
//  WeatherData.swift
//  Clima
//
//  Created by Nitin Birdi on 27/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [detail]
}

struct Main: Decodable {
    var temp: Double
}

struct detail: Decodable {
    var id: Int
    var description: String
    
}
