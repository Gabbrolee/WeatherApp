//
//  ForecastFetcher.swift
//  WeatherApp
//
//  Created by user on 10/08/2021.
//

import UIKit

let apiKey = "170fb8b7e0e953d9d4ca65f101868cda"
let city = "Makurdi"
let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"

class LoadCurrentData {
  func fetchCurrentData(city: String, forcast:Bool,completionHandler: @escaping (WeatherInfo)-> () ){
    
    if let url = URL(string: urlString) {
      URLSession.shared.dataTask(with: url) { data, response, error in
        print(data!)
        if let error = error {
          print("Eror: \(error.localizedDescription)")
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
          print("Error : HTTP Response Code Error")
          return
        }
        
        guard let data = data else{
          print("Error: No Response")
          return
        }
  //      if (!forcast){
          do {
            let weatherInfo = try JSONDecoder().decode(WeatherInfo.self, from: data)
            print(weatherInfo)
            DispatchQueue.main.async {
              completionHandler(weatherInfo)
            }
          } catch {
            print(error.localizedDescription)
          }
 //       }else{
 //       }
      }.resume()
    }
  }
  // this function fetch the forecast weather data
  func fetchForecastData(city: String, completionHandler: @escaping (ForeCastResponse)-> () ){
    let apiKey = "28cb3dc805390fe699ccddc6ca324cef"
    
    let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&cnt=5&appid=\(apiKey)&units=metric"
    if let url = URL(string: urlString) {
      URLSession.shared.dataTask(with: url) { data, response, error in
        print(data!)
        if let error = error {
          print("Eror: \(error.localizedDescription)")
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
          print("Error : HTTP Response Code Error")
          return
        }
        
        guard let data = data else{
          print("Error: No Response")
          return
        }
   //     if (!forcast){
          do {
            let weatherInfo = try JSONDecoder().decode(ForeCastResponse.self, from: data)
            print(weatherInfo)
            DispatchQueue.main.async {
              completionHandler(weatherInfo)
            }
          } catch {
            print(error.localizedDescription)
          }
    //    }else{
    //    }
      }.resume()
    }
  }
  
}
