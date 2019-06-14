//
//  CarouselCollectionViewCell.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 12/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var motiefLabel: UILabel!
    @IBOutlet weak var vraag1Label: UILabel!
    @IBOutlet weak var vraag2Label: UILabel!
    @IBOutlet weak var vraag3Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.carView.layer.opacity = 0.9
            self.carView.layer.cornerRadius = 7
//            self.carView.layer.shadowColor = UIColor.gray.cgColor
//            self.carView.layer.shadowOpacity = 0.5
//            self.carView.layer.shadowOpacity = 10.0
//            self.carView.layer.shadowOffset = .zero
//            self.carView.layer.shadowPath = UIBezierPath(rect: self.carView.bounds).cgPath
//            self.carView.layer.shouldRasterize = true
        }
    }

}
