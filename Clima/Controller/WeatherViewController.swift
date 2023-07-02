//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

// The class below is a subClass of UIViewController

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()   // This allows us to get the GPS location of the phone. Note we have to add the privacy in the info file too.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self // We have to set the weatherManager as the delegate BEFORE requesting the location
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
}


//MARK: - UITextFieldDelegate
/*
    We have made the WeatherViewController code simplier by extracting out some code and placing it into extensions.
    We can sepearte out our extension code from the rest by placing in a section. This is done through using comment "MARK -"
 */

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // when the user clicks the search icon it will dismiss the keyboard
    }
    
    // This function below enables us to retrieve something after the user click "go" or "enter"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // When the user clicks search on the keyboard it dismisses the keyboard
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text != "") {
            return true     // if true then it will end editing text field
        } else {
            textField.placeholder = "Type something"    // changes the place holder
            return false        // will not end editing
        }
    }
    
    // This is triggered when editing is done
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""   // resets the text input field
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        /*
         The data contained in weather.temperatureString is completely dependent if the networking task has been completed in WeatherManager.
         It could take from a few seconds to a few minutes so it would freeze the UI because it can't set the text as there is nothing to set with and so all the other UI buttons will stop working on the main thread.
         
         The solution is to wrap the code below with the DispatchQueue to call the main thread to update the UI once its completed.
         Note, since it is a closure function we have to add self.
         */
        DispatchQueue.main.async{
            self.temperatureLabel.text = weather.temperatureString  // updating the text label
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }

    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    
    /*
     When the locationManager calls this method. It also passes in the locations input which is an array of CLLocation
     */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        /*
         The LocationManager would generally get several locations so its best to always get the last one in the array.
         Since locations.last is an optional. In order to use it we should do an if let
         */
        if let location = locations.last {
            
            /*
             So want to stop updating the location as soon as we got the location information
             This allows us to call the locationManager.requestLocation() again in the future (i.e. when we press the current location icon)
             */
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
