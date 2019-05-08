//
//  Bird.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 5/5/19.
//  Copyright © 2019 Chelsea Troy. All rights reserved.
//

import Foundation

struct Bird: Codable {
    let name: String?
    let imageUrl: String
}

struct BirdResult: Codable {
    let birds: [Bird]
}
