//
//  ViewController.swift
//  Egg Timer
//
//  Created by Sergio Díaz Navarro on 12/6/16.
//  Copyright © 2016 Sergio Díaz Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var time = 210

    @IBOutlet weak var timerLabel: UILabel!
    
    func decreaseTimer(){
     
        if time > 0{
            time -= 1
            timerLabel.text = String(time)
        } else{
            timer.invalidate()
        }
    }
    
    
    @IBAction func play(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    
    @IBAction func minusTen(_ sender: Any) {
        if(time > 10){
            time -= 10
            timerLabel.text = String(time)
        }
    }
    
    
    @IBAction func plusTen(_ sender: Any) {
        time += 10
        timerLabel.text = String(time)
    }
    
    
    @IBAction func reset(_ sender: Any) {
        
        time = 210
        timerLabel.text = String(time)
        timer.invalidate()

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

