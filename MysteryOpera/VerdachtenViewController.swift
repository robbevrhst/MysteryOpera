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
        flowLayout.spacingMode = .fixed(spacing: 5.0)
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
        for (_, subJSON) in json["data"]{
            let item = subJSON["verdachten"]
            let new = CharacterItem(name:item["name"].stringValue, text:item["text"].stringValue, motief:item["motief"].stringValue)
            characterItems.append(new);
        }
    //        tableView.reloadData()
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        print(characterItems.count)
        print(characterItems)
    }
    
    
    // MARK:- UICollectionView Delegate and Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("number of items is \(characterItems.count)")
        return characterItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselCollectionView.dequeueReusableCell(withReuseIdentifier: "carouselIdentifier", for: indexPath) as! CarouselCollectionViewCell
        
        cell.nameLabel.text = "Personage \(indexPath.row + 1)"
        cell.bioLabel.text = "Biografie van personage \(indexPath.row + 1)...lfmlsdkjfmlsqdf dsf dfm sdf qsfml jsdfl qsdjfkls djf dslkfj dlskf qsdjlf sdlkfj qsdlmkfj qsdlmf qsdmlf qsdmkf dsjflksd jfldsk fjsdkfsldkf jqslkfd jqksld fjksqldf jldsk fjsqdlkf."
        
        return cell
    }
    
}
