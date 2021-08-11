//
//  ModelOfForecast.swift
//  WeatherApp
//
//  Created by user on 10/08/2021.
//

import UIKit


struct ForeCastResponse: Decodable {
  let list: [ListDetails]
  
}

struct ListDetails: Decodable{
  let main: MainDetails
  let weather: [WeatherDetails]
}

struct MainDetails: Decodable {
  let temp: Double
}

struct WeatherDetails: Decodable{
  let main: String
}
