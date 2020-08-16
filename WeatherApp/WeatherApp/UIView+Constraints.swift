//
//  UIView+Constraints.swift
//  WeatherApp
//
//  Created by Vanoshan  Ramdhani on 2020/08/13.
//  Copyright © 2020 Vanoshan  Ramdhani. All rights reserved.
//

import UIKit

extension UIView{
    
    func fullScreenSafeArea(for view: UIView){
        
        self.translatesAutoresizingMaskIntoConstraints = false
       self.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        self.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
    }
    
    func fullScreen(for view: UIView){
           
           self.translatesAutoresizingMaskIntoConstraints = false
           self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
           self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
           self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           
       }
    
    
}
