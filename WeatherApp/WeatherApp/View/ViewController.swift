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
  var model2: ForeCastResponse?
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    getPresentWeather()
  }



func getPresentWeather(){
  loader.fetchCurrentData(city: "Lagos", forcast: false, completionHandler: { [self] (data) in
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
  
  loader.fetchForecastData(city: "Lagos", forcast: false) { [self] (data) in
    model2 = data
    
    TuesdayOutlet.text = String(describing: Int(model2?.list[0].main.temp ?? 0.0))
    WednesdayOutlet.text = String(describing: Int(model2?.list[1].main.temp ?? 0.0))
    ThursdayOutlet.text = String(describing: Int(model2?.list[2].main.temp ?? 0.0))
    FridayOutlet.text = String(describing: Int(model2?.list[3].main.temp ?? 0.0))
    SaturdayOutlet.text = String(describing: Int(model2?.list[4].main.temp ?? 0.0))
  }
  
}
  
  
}
