//
//  ModelOfForecast.swift
//  WeatherApp
//
//  Created by user on 10/08/2021.
//

import Foundation
struct WeatherForecast: Codable {
  var temp: Float
  var temp_min: Float
  var temp_max: Float
}
struct WeatherMain: Codable {
  let main: WeatherForecast
  
}
struct DataFromWeather: Decodable {
  let list: [List]
}
struct Main: Decodable {
  let temp: Float
  let temp_max: Float
  let temp_min: Float
  
}
 
struct Weather2: Decodable {
  let main: String
  let description: String
  let icon: String
  
}

struct List: Decodable {
  let main: Main
  let weather: [Weather2]
  let dt: Int
}

