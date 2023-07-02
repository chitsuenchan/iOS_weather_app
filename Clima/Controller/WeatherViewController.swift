//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

// The class below is a subClass of UIViewController

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
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
        }

    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
