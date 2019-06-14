//
//  VerdachtenViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 12/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout
import Alamofire
import SwiftyJSON

class VerdachtenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    let path:String = "http://www.thrillstudio.be/admin/index.php?page=detail&id=1&accept=json"
    var characterItems = [CharacterItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadJSON()
        
        carouselCollectionView.register(UINib.init(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "carouselIdentifier")
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 200.0, height: carouselCollectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemAlpha = 0.8
        flowLayout.spacingMode = .fixed(spacing: 40.0)
//        flowLayout.sideItemScale = 0.8
        
        carouselCollectionView.collectionViewLayout = flowLayout
        
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
    }
    
    func loadJSON(){
        request(path, method: .get).validate().responseJSON { (response) in
            switch response.result{
            case .success(let value):
                let json = JSON(value);
                self.parseJSON(json:json);
            case .failure(let error):
                print(error);
            }
        }
    }
    
    func parseJSON(json:JSON){
        for (_, item) in json["data"][0]["verdachten"]{
            let new = CharacterItem(name:item["name"].stringValue, text:item["text"].stringValue, motief:item["motief"].stringValue, vraag1:item["vraag_1"].stringValue, vraag2:item["vraag_2"].stringValue, vraag3:item["vraag_3"].stringValue)
            characterItems.append(new);
        }
        carouselCollectionView.reloadData()
        print("done parsing")
    }
    
    
    // MARK:- UICollectionView Delegate and Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = carouselCollectionView.dequeueReusableCell(withReuseIdentifier: "carouselIdentifier", for: indexPath) as! CarouselCollectionViewCell
        
        cell.nameLabel.text = characterItems[indexPath.row].name
        cell.bioLabel.text = characterItems[indexPath.row].text
        cell.motiefLabel.text = characterItems[indexPath.row].motief
        cell.vraag1Label.text = characterItems[indexPath.row].vraag1
        cell.vraag2Label.text = characterItems[indexPath.row].vraag2
        cell.vraag3Label.text = characterItems[indexPath.row].vraag3
        
        return cell
    }
    
}
