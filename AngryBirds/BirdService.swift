//
//  BirdService.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 5/5/19.
//  Copyright © 2019 Chelsea Troy. All rights reserved.
//

import Foundation

class BirdService {
    var birds: [Bird]
    
    init() {
        birds = [
            Bird(name: "European Sparrow", imagePath: "alsoEuropeanSparrow"),
            Bird(name: "Amazon", imagePath: "amazon"),
            Bird(name: "American Sparrow", imagePath: "americanSparrow"),
            Bird(name: "Bald Eagle", imagePath: "baldEagle"),
            Bird(name: "Bluebird", imagePath: "bluebird"),
            Bird(name: "Black Necked Bluebird", imagePath: "blackNeckedBluebird"),
            Bird(name: "Cardinal", imagePath: "cardinal"),
            Bird(name: "European Sparrow", imagePath: "europeanSparrow"),
            Bird(name: "Hawk", imagePath: "hawk"),
            Bird(name: "Hummingbird", imagePath: "hummingbird"),
            Bird(name: "Parrots", imagePath: "parrots"),
            Bird(name: "Finch", imagePath: "someKindOfLargeFinch"),
            Bird(name: "Willie Wagtail", imagePath: "willieWagtail"),
            Bird(name: "Oriole", imagePath: "oriole")
        ]
    }
    
    func getBirds() -> [Bird] {
        return birds
    }
}
