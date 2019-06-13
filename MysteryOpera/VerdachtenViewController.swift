//
//  VerdachtenViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 12/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class VerdachtenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    carouselCollectionView.register(UINib.init(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "carouselIdentifier")
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 200.0, height: carouselCollectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemAlpha = 0.8
        flowLayout.spacingMode = .fixed(spacing: 5.0)
//        flowLayout.sideItemScale = 0.8
        
        carouselCollectionView.collectionViewLayout = flowLayout
        
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
    }
    
    // MARK:- UICollectionView Delegate and Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselCollectionView.dequeueReusableCell(withReuseIdentifier: "carouselIdentifier", for: indexPath) as! CarouselCollectionViewCell
        
        cell.nameLabel.text = "Personage \(indexPath.row + 1)"
        cell.bioLabel.text = "Biografie van personage \(indexPath.row + 1)...lfmlsdkjfmlsqdf dsf dfm sdf qsfml jsdfl qsdjfkls djf dslkfj dlskf qsdjlf sdlkfj qsdlmkfj qsdlmf qsdmlf qsdmkf dsjflksd jfldsk fjsdkfsldkf jqslkfd jqksld fjksqldf jldsk fjsqdlkf."
        
        return cell
    }
    
}
