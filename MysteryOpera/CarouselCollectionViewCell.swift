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
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.carView.layer.opacity = 0.9
            self.carView.layer.cornerRadius = 7
        }
    }

    @IBAction func button1Pressed(_ sender: UIButton) {
        let checkedImage = UIImage(named: "checked")! as UIImage
        button1.setImage(checkedImage, for: .normal)
    }
    
    @IBAction func button2Pressed(_ sender: UIButton) {
        let checkedImage = UIImage(named: "checked")! as UIImage
        button2.setImage(checkedImage, for: .normal)
    }
    
    @IBAction func button3Pressed(_ sender: UIButton) {
        let checkedImage = UIImage(named: "checked")! as UIImage
        button3.setImage(checkedImage, for: .normal)
    }
    
}
