//
//  ViewController.swift
//  Weather App (API)
//
//  Created by Sergio Díaz Navarro on 1/3/17.
//  Copyright © 2017 Sergio Díaz Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    func jsonConfig(city:String){
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + city +  ",uk&appid=5e3c28bbcfe1a75a5559e166e47518de"){
        
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    
                    print(error)
                    
                } else {
                    
                    if let urlContent = data {
                        
                        do {
                            
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            //print(jsonResult)
                            
                            //print(jsonResult["name"])
                            
                            
                            
                            if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                
                                DispatchQueue.main.sync(execute: {
                                    
                                    if description != nil{
                                        
                                        self.weatherLabel.text = "The weather in " + city + ": " + "\n" + description
                                    } else{
                                        
                                        self.weatherLabel.text = "Couldn't find weather for " + city + ". Please try another"

                                    }
                                    
                                })
                            }
                            
                        
                            
                        } catch {
                            
                            print("JSON Processing Failed")
                            
                        }
                        
                    }
                    
                    
                }
                
            }
            
            task.resume()

       
        } else {
            
            weatherLabel.text = "Couldn't find weather for that city. Please try another"
        }
        
    }
    
    @IBAction func submit(_ sender: Any) {
        
        
        let city = textField.text
        
        let newCity = city?.replacingOccurrences(of: " ", with: "%20")

        
        print("Current city ->" + newCity!)
        
        if city != nil{
            
            jsonConfig(city: newCity!)

        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

