//
//  WeatherManager.swift
//  Clima
//
//  Created by Chi  Chan on 2/7/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=1e1494de00c762a08ac857ac46467ac1&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        self.performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon\(longitude)"
        
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        
        // 1. Create a URL
        /*
         The URL is optional as the urlString could be "" so we should use if let
         */
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            /*
             A completionHandler is what happens when we get the response. It takes a function.
             This doesn't have any data in the arguments because once the task is completed with making the API
             It will then call the handle function and populate it with the arguements (data, response and error)
             */
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return      // return with nothing means break out of the function
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        
                        // Once we get a response with some data then we call the didUpdateWeather function and send over the weather data
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
                
            }
            
            // 4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data)  -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    

}
