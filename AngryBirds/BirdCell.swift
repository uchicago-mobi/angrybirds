//
//  BirdCell.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 5/5/19.
//  Copyright © 2019 Chelsea Troy. All rights reserved.
//

import Foundation
import UIKit

class BirdCell: UICollectionViewCell {
    var bird: Bird? {
        didSet {
            if let imageURL = URL(string: bird!.imageUrl) {
                DispatchQueue.global(qos: .userInitiated).async {
                    let imageData: NSData = NSData(contentsOf: imageURL)!

                    DispatchQueue.main.async {
                        let image = UIImage(data: imageData as Data)
                        self.birdImageView.image = image
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var birdImageView: UIImageView!
    
    override func awakeFromNib() {
        layer.cornerRadius = 88
    }
    
}
