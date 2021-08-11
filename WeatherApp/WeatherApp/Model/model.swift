//
//  model.swift
//  WeatherApp
//
//  Created by user on 10/08/2021.
//

import UIKit
struct WeatherInfo:Codable{
  let main: PresentWeather
  
}

struct PresentWeather: Codable{
  var temp: Float
  var temp_min: Float
  var temp_max: Float

}



