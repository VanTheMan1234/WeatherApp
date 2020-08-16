//
//  WeatherViewCOntroller.swift
//  WeatherApp
//
//  Created by Vanoshan  Ramdhani on 2020/08/09.
//  Copyright © 2020 Vanoshan  Ramdhani. All rights reserved.
//

import UIKit

class WeatherViewCOntroller: UIViewController {
    
    var viewMain: WeatherUI! {
        return self.view as! WeatherUI
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func loadView() {
        
        self.view = WeatherUI(frame: UIScreen.main.bounds)
       
    }
}

