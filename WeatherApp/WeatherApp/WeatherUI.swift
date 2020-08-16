//
//  WeatherUI.swift
//  WeatherApp
//
//  Created by Vanoshan  Ramdhani on 2020/08/13.
//  Copyright © 2020 Vanoshan  Ramdhani. All rights reserved.
//

import UIKit
class WeatherUI: UIView{
    
    let tableView = UITableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        getWeather()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(contentView)
        contentView.addSubview(mainStackView)
        self.mainStackView.addArrangedSubview(tempLabel)
        self.mainStackView.addArrangedSubview(typeWeather)
        self.contentView.addSubview(horizontalStackView)
        self.horizontalStackView.addArrangedSubview(tempMinLabel)
        self.horizontalStackView.addArrangedSubview(tempCurrentLabel)
        self.horizontalStackView.addArrangedSubview(tempMaxLabel)
        self.addSubview(contentView2)
        setupTableView()
        
    }
    
    func setupConstraints(){
        
         contentView.translatesAutoresizingMaskIntoConstraints = false
              contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
              contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
              contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
              contentView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        horizontalStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        typeWeather.translatesAutoresizingMaskIntoConstraints = false
        typeWeather.bottomAnchor.constraint(equalTo: self.horizontalStackView.bottomAnchor, constant: -50).isActive = true
        
        contentView2.translatesAutoresizingMaskIntoConstraints = false
        contentView2.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        contentView2.topAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        contentView2.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        contentView2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }()
    
    let contentView2: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .green
        return view
    }()
    
    let mainStackView: UIStackView = {
        
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
        
    }()
    
    let horizontalStackView: UIStackView = {
           
           let stackView = UIStackView(frame: .zero)
           stackView.axis = .horizontal
           stackView.distribution = .equalSpacing
           stackView.spacing = 10
           return stackView
           
       }()
    
    func setupTableView() {
        contentView2.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: contentView2.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: contentView2.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: contentView2.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: contentView2.rightAnchor).isActive = true
    }
    
    func getWeather() {
        URLSession.shared.dataTask(with: URL(string: "http://api.openweathermap.org/data/2.5/weather?q=durban,za?&units=metric&APPID=04134ec4bdfc28d857a7a8eff86bd260")!) { data, response, error in
            if let error = error {
                print("Error:\n\(error)")
            } else {
                do {
                    let JSon = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                    
                    let weatherData = (JSon["weather"]as! NSArray)
                    if let Temp1 = weatherData[0] as? NSDictionary {
                        DispatchQueue.main.async {
                            self.typeWeather.text = Temp1["description"] as? String
                        }
                    }
                    if let mainDictionary = JSon["main"] as? NSDictionary {
                        
                        if let temperature = mainDictionary.value(forKey: "temp") {
                            DispatchQueue.main.async {
                                self.tempLabel.text = "\(temperature)°C"
                                print(self.tempLabel)
                            }
                        }
                        if let temperature = mainDictionary.value(forKey: "temp_min") {
                            DispatchQueue.main.async {
                                self.tempMinLabel.text = "Min: \(temperature)°C"
                                print(self.tempLabel)
                            }
                        }
                        if let temperature = mainDictionary.value(forKey: "temp_max") {
                            DispatchQueue.main.async {
                                self.tempMaxLabel.text = "Max: \(temperature)°C"
                                print(self.tempLabel)
                            }
                        }
                        if let temperature = mainDictionary.value(forKey: "temp") {
                            DispatchQueue.main.async {
                                self.tempCurrentLabel.text = "Current:  \(temperature)°C"
                                print(self.tempLabel)
                            }
                        }


                        
                    }
                } catch let jsonError as NSError {
                    print("JSON error:\n\(jsonError.description)")
                }
            }
            
        }.resume()
        
    }
    
    let tempLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "text"
        return label
        
    }()
    
    let tempMinLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "text"
        return label
        
    }()
    
    let tempCurrentLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "text"
        return label
        
    }()
    
    let tempMaxLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "text"
        return label
        
    }()
    
    let typeWeather: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 36)
        label.textColor = .white
        label.textAlignment = .center
        label.text = ""
        return label
        
    }()
    
    let typeWeatherImage: UIImageView = {
        
        let image = UIImage(named: "sea_sunnypng.png")
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFit
        return iv
        
        
    }()
}
