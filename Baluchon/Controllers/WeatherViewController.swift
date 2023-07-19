//
//  WeatherViewController.swift
//  Baluchon
//
//  Created by Yann Perfy on 06/06/2022.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var meteo: UIButton!
    @IBOutlet weak var localisation: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var valider: UIButton!
    @IBOutlet weak var activityIndicator:
    UIActivityIndicatorView!
    @IBOutlet weak var ville1: UILabel!
    @IBOutlet weak var ville2: UILabel!
    @IBOutlet weak var ville3: UILabel!
    @IBOutlet weak var paysCode1: UILabel!
    @IBOutlet weak var paysCode2: UILabel!
    @IBOutlet weak var paysCode3: UILabel!
    @IBOutlet weak var temperature1: UILabel!
    @IBOutlet weak var temperature2: UILabel!
    @IBOutlet weak var temperature3: UILabel!
    @IBOutlet weak var visibilité1: UILabel!
    @IBOutlet weak var visibilité2: UILabel!
    @IBOutlet weak var visibilité3: UILabel!
    
    
    
    
 
    @IBOutlet weak var visibilité: UILabel!
    
    @IBOutlet weak var vent: UILabel!
    
    @IBOutlet weak var lever: UILabel!
    
    @IBOutlet weak var pression: UILabel!
   
    @IBOutlet weak var humidté: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var viewVisibité: UIView!
    
    @IBOutlet weak var viewVent: UIView!
    
    @IBOutlet weak var viewLever: UIView!
    
    @IBOutlet weak var viewPression: UIView!
    
    @IBOutlet weak var viewRessentir: UIView!
    
    @IBOutlet weak var viewHumidité: UIView!
    
    @IBOutlet weak var viewVille3: UIView!
    @IBOutlet weak var viewTemperatureactuelle: UIView!
    
    @IBOutlet weak var stackVille1: UIStackView!
    
    @IBOutlet weak var stackVille2: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackVille1.layer.cornerRadius = 10
        stackVille2.layer.cornerRadius = 10
        viewVille3.layer.cornerRadius = 20
        viewTemperatureactuelle.layer.cornerRadius = 20
        
        meteo.layer.cornerRadius = 30
        valider.layer.cornerRadius = 30
        localisation.layer.cornerRadius = 50
        mainView.layer.cornerRadius = 40
        viewVent.layer.cornerRadius = 20
        viewLever.layer.cornerRadius = 20
        viewPression.layer.cornerRadius = 20
        viewHumidité.layer.cornerRadius = 20
        
        viewRessentir.layer.cornerRadius = 20
        viewVisibité.layer.cornerRadius = 20
        
        searchWeather()
    }
    
    @IBAction func didTapWeatherButton() {
        searchWeather() // celui avec le parametre textfield.text
     
    }
    
    func searchWeather() {
        toggleActivityIndicator(shown: true)
        guard let name = textField.text else { return }

        WeatherService.shared.getWeather(name: name) { (success, data) in
            self.toggleActivityIndicator(shown: false)
            if success, let data = data {
                self.updateName3(withWeather: data)
                    
                
                WeatherService.shared.getWeather(name: "Strasbourg") { (success, data) in
                    if success, let data = data {
                        self.updateName1(withWeather: data)
                    } else {
                        self.presentAlert()
                    }
                    
                    WeatherService.shared.getWeather(name: "Paris") { (success, data) in
                        if success, let data = data {
                            self.updateName(withWeather: data)
                        } else {
                            self.presentAlert()
                        }
                    }
                }
            } else {
                self.presentAlert()
            }
            
        }
    }

    
    private func updateName(withWeather weather: Weather) {
        self.visibilité2.text = weather.weather.first?.weatherDescription
        self.temperature2.text = String(weather.main.temp)
        self.paysCode2.text = String(weather.sys.country)
  
        self.humidté.text = String(weather.main.humidity)
        self.lever.text =  weather.weather.first?.weatherDescription
        self.pression.text = String(weather.main.pressure)
        self.ville2.text = weather.name
        
       
    }
    
    private func updateName1(withWeather weather: Weather) {
        self.visibilité1.text = weather.weather.first?.weatherDescription
        self.visibilité.text = weather.weather.first?.weatherDescription
        self.temperature1.text = String(weather.main.temp)
        self.paysCode1.text = String(weather.sys.country)
  
        self.humidté.text = String(weather.main.humidity)
        self.lever.text =  weather.weather.first?.weatherDescription
        self.pression.text = String(weather.main.pressure)
        self.ville1.text = weather.name
        
       
    }
    
    private func updateName3(withWeather weather: Weather) {
        self.visibilité3.text = weather.weather.first?.weatherDescription
        self.temperature3.text = String(weather.main.temp)
        self.paysCode3.text = String(weather.sys.country)
  
        self.humidté.text = String(weather.main.humidity)
        self.lever.text =  weather.weather.first?.weatherDescription
        self.pression.text = String(weather.main.pressure)
        self.ville3.text = weather.name
        
       
    }
        
        
    private func toggleActivityIndicator(shown: Bool) {
    activityIndicator.isHidden = !shown
        valider.isHidden = shown
    }

    private func presentAlert() {
        let alertVC =   UIAlertController(title: "error", message: "could not find weather ", preferredStyle: .alert )
        alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    
    }
}

extension UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    

}
