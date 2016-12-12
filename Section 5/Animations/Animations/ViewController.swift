//
//  ViewController.swift
//  Animations
//
//  Created by Sergio Díaz Navarro on 12/12/16.
//  Copyright © 2016 Sergio Díaz Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var iCont = 0;

    
    
    @IBAction func next(_ sender: Any) {
        
        iCont+=1;
        
        if(iCont > 6){
            iCont = 0
        }
        
        
        image.image = UIImage(named: "frame_" + String(iCont) + "_delay-0.08s.gif")
        
        print(iCont)
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

