//
//  ViewController.swift
//  WeatherApp
//
//  Created by user on 07/08/2021.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var displayTemperature: UILabel!
  @IBOutlet var displayMinTemperature: UILabel!
  @IBOutlet var displayCurrentTemperature: UILabel!
  @IBOutlet var displayMaximumTemperature: UILabel!
  
  @IBOutlet var SunnyOutlet: UILabel!
  
  @IBOutlet var TuesdayOutlet: UILabel!
  @IBOutlet var WednesdayOutlet: UILabel!
  @IBOutlet var ThursdayOutlet: UILabel!
  @IBOutlet var FridayOutlet: UILabel!
  @IBOutlet var SaturdayOutlet: UILabel!
  
  @IBOutlet var TuesdayCurrentOutlet: UIImageView!
  @IBOutlet var WednesdayCurrentOutlet: UIImageView!
  @IBOutlet var ThursdayCurrentOutlet: UIImageView!
  @IBOutlet var FridayCurrentOutlet: UIImageView!
  @IBOutlet var SaturdayCurrentOutlet: UIImageView!
  
  var displayTemp: Int = 0
  var displayMinTemp: Int = 0
  var displayCurrentTemp: Int = 0
  var displayMaxTemp: Int = 0
  
  var loader = LoadCurrentData()
  var model: WeatherInfo?
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    getPresentWeather()
  }



func getPresentWeather(){
  loader.fetchForecastData(city: "Benue", forcast: false, completionHandler: { [self] (data) in
    model = data
    
    
    displayTemp =  Int((model?.main.temp)!)
    displayMinTemp = Int((model?.main.temp_min)!)
    displayMaxTemp =   Int((model?.main.temp_max)!)
    displayCurrentTemp =  Int((model?.main.temp)!)
    
    displayTemperature.text = "\(displayTemp - 273)°"
    displayMinTemperature.text = "\(displayMinTemp - 273)°"
    displayMaximumTemperature.text = "\(displayMaxTemp - 273)°"
    displayCurrentTemperature.text = "\(displayTemp - 273)°"
    
    
    
  })
  
}
  
  func getForecastWeather(){
    loader.fetchForecastData(city: "Benue", forcast: false, completionHandler: { [self] (data) in
      model = data
   
//      TuesdayOutlet.text = "\()"
      
    })
    
  }
}
