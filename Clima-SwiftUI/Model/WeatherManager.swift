//
//  WeatherManager.swift
//  Clima-SwiftUI
//
//  Created by Abdul R. Arraisi on 03/10/20.
//

import SwiftUI

struct WheatherManager {
    let wheatherUrl = "https://api.openweathermap.org/data/2.5/weather?&appid=b8e357cb99a7cb8f00fe65623451cf76&units=metric"
    
    func fetchWhether(city: String) {
        let urlString = "\(wheatherUrl)&q=\(city)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { (data: Data?, urlResponse: URLResponse?, error: Error?) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let dataSafe = data {
                    let dataString = String(data: dataSafe, encoding: .utf8)
                    print(dataString!)
                }
            }
            
            task.resume()
        }
    }
}
