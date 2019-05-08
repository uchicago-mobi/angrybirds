//
//  BirdService.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 5/5/19.
//  Copyright © 2019 Chelsea Troy. All rights reserved.
//

import Foundation

class BirdService {
    var dataTask: URLSessionDataTask?
        
    private let urlString = "http://www.mocky.io/v2/5cd2449d3100004714339680"
        
    func getBirds(completion: @escaping ([Bird]?, Error?) -> ()) {
            guard let url = URL(string: self.urlString) else {
                    print("invalid url: \(self.urlString)")
                    return
            }
                
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    
                guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                    DispatchQueue.main.async { completion(nil, error) }
                    return
                }
                    
                print("Status code: \(response.statusCode)")
                print(String(data: data, encoding: .utf8) ?? "unable to print data")
                    
                do {
                    let decoder = JSONDecoder()
                    let birdResult = try decoder.decode(BirdResult.self, from: data)
                    DispatchQueue.main.async { completion(birdResult.birds, nil) }
                } catch (let error) {
                    DispatchQueue.main.async { completion(nil, error) }
                }
            }
            task.resume()
        }
    }
