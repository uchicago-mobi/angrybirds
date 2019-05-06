//
//  ViewController.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 5/5/19.
//  Copyright © 2019 Chelsea Troy. All rights reserved.
//

import UIKit

class AngryBirdsCollectionViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var birdCollectionView: UICollectionView!
    @IBOutlet weak var birdFlowLayout: UICollectionViewFlowLayout!
    
    let birdService = BirdService()
    var birds: [Bird] = []
    
    private let reuseIdentifier = "angryBirdCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Angry Birds"
        
        self.birdCollectionView.delegate = self
        self.birdCollectionView.dataSource = self
        
        self.birdFlowLayout.scrollDirection = .horizontal
        self.birdFlowLayout.minimumLineSpacing = 0
        self.birdFlowLayout.minimumInteritemSpacing = 0
        self.birdFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.birds = self.birdService.getBirds()
        self.birdCollectionView.reloadData()
    }
    
}

extension AngryBirdsCollectionViewController: UICollectionViewDataSource {
    //MARK: DataSource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return self.birds.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        let bird = self.birds[indexPath.row]
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BirdCell
        cell.backgroundColor = .black
        
        cell.birdImageView.image = UIImage(named: bird.imagePath)
        return cell
    }
}

extension AngryBirdsCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = self.birdFlowLayout.sectionInset.left * (2 + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 2

        return CGSize(width: widthPerItem, height: widthPerItem)
    }


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.birdFlowLayout.sectionInset
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.birdFlowLayout.sectionInset.left
    }
}


