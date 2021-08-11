//
//  model.swift
//  WeatherApp
//
//  Created by user on 10/08/2021.
//

import UIKit
struct WeatherInfo: Decodable{
  let main: PresentWeather
  let weather: [WeatherDets]
}
struct WeatherDets: Decodable {
  let main: String
}
struct PresentWeather: Decodable{
  var temp: Float
  var temp_min: Float
  var temp_max: Float

}



