//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class WeatherViewController: UIViewController {
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherModel = LessonModel(name: "Thirteenth lesson", type: "CliMa)))", imageData: #imageLiteral(resourceName: "DiceSix"), withIdentifire: "ClimaVC", storyboardName: "Clima")
    
    var people: [NSManagedObject] = []
    
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    var suggestionsArray: [String] = []
    //var savedCoreArray = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        
        searchTextField.delegate = self
        
        importData()
        retrieveValues()
    }
    
    func importData() {
        if let filepath = Bundle.main.path(forResource: "Cities", ofType: "txt") {
            do {
                var tempContent = [""]
                let contents = try String(contentsOfFile: filepath)
                tempContent = contents.components(separatedBy: "\n")
                suggestionsArray = tempContent
                
            } catch {
                print(error)
                // contents could not be loaded
            }
        } else {
            print("example.txt not found!")
        }
       // return suggestionsArray
    } 
}

//MARK:- UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        //textField.resignFirstResponder()    //autocomplition
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text  != ""{
            return true
        }else {
            textField.placeholder = "Type the city"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        save(value: searchTextField.text!)  // save value in CoreData
        
        //retrieveValues()
        
        if let city = searchTextField.text {
            
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    //MARK:- Autocomplition
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return !autoCompleteText( in : textField, using: string, suggestionsArray: suggestionsArray)
    }
    
    func autoCompleteText( in textField: UITextField, using string: String, suggestionsArray: [String]) -> Bool {
        if !string.isEmpty,
           let selectedTextRange = textField.selectedTextRange,
           selectedTextRange.end == textField.endOfDocument,
           let prefixRange = textField.textRange(from: textField.beginningOfDocument, to: selectedTextRange.start),
           let text = textField.text( in : prefixRange) {
            let prefix = text + string
            let matches = suggestionsArray.filter {
                $0.hasPrefix(prefix)
            }
            if (matches.count > 0) {
                textField.text = matches[0]
                if let start = textField.position(from: textField.beginningOfDocument, offset: prefix.count) {
                    textField.selectedTextRange = textField.textRange(from: start, to: textField.endOfDocument)
                    return true
                }
            }
        }
        return false
    }
}

//MARK:- WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.nameOfCity
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
//MARK:- CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
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
//MARK:- CoreData
extension WeatherViewController {
    func save(value: String) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            
            guard let entityDescription = NSEntityDescription.entity(forEntityName: "CoreEntity", in: context) else { return }
            
            let newValue = NSManagedObject(entity: entityDescription, insertInto: context)
            newValue.setValue(value, forKey: "coreName")
            
            do {
                if suggestionsArray.contains(value) {                 // check if element exist in coreData & if no -> ADD it
                    print("This element already exist")
                } else {
                    try context.save()
                    suggestionsArray.append(value)
                } // [] get a new value
            } catch {
                print("Saved Error")
            }
        }
    }
    
    /*private*/ func retrieveValues() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let contex = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<CoreEntity/*NSManagedObject*/>(entityName: "CoreEntity")
            
            do {
                let results = try contex.fetch(fetchRequest)
                
                for result in results {
                    if let savedArray = result.coreName {
                        suggestionsArray.append(savedArray) // set an aditional new value
                    }
                }
            } catch {
                print("Could not retrieve")
            }
        }else { return }
    }
}

