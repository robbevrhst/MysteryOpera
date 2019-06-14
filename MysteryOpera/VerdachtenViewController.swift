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
import QuartzCore

class VerdachtenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var verdachtenBordView: UIView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var moordenaarLabel: UILabel!
    @IBOutlet weak var wapenLabel: UILabel!
    @IBOutlet weak var moordenaarBg: UIView!
    @IBOutlet weak var wapenBg: UIView!
    
    @IBOutlet weak var charOne: UIButton!
    @IBOutlet weak var charTwo: UIButton!
    @IBOutlet weak var charThree: UIButton!
    @IBOutlet weak var charFour: UIButton!
    @IBOutlet weak var charFive: UIButton!
    @IBOutlet weak var charSix: UIButton!
    
    @IBOutlet weak var wpnOne: UIButton!
    @IBOutlet weak var wpnTwo: UIButton!
    @IBOutlet weak var wpnThree: UIButton!
    @IBOutlet weak var wpnFour: UIButton!
    @IBOutlet weak var wpnFive: UIButton!
    @IBOutlet weak var wpnSix: UIButton!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    var charOneSelected:Bool = false
    var charTwoSelected:Bool = false
    var charThreeSelected:Bool = false
    var charFourSelected:Bool = false
    var charFiveSelected:Bool = false
    var charSixSelected:Bool = false

    var wpnOneSelected:Bool = false
    var wpnTwoSelected:Bool = false
    var wpnThreeSelected:Bool = false
    var wpnFourSelected:Bool = false
    var wpnFiveSelected:Bool = false
    var wpnSixSelected:Bool = false
    
    let path:String = "http://www.thrillstudio.be/admin/index.php?page=detail&id=1&accept=json"
    var characterItems = [CharacterItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verdachtenBordView.isHidden = true
        submitBtn.layer.cornerRadius = 10
        submitBtn.clipsToBounds = true
        moordenaarLabel.layer.masksToBounds = true
        wapenLabel.layer.masksToBounds = true
        moordenaarLabel.layer.cornerRadius = 25
        wapenLabel.layer.cornerRadius = 25
        moordenaarBg.layer.cornerRadius = 10
        wapenBg.layer.cornerRadius = 10
        
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
            let new = CharacterItem(name:item["name"].stringValue, text:item["text"].stringValue, motief:item["motief"].stringValue, img:item["img"].stringValue, vraag1:item["vraag_1"].stringValue, vraag2:item["vraag_2"].stringValue, vraag3:item["vraag_3"].stringValue)
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
        cell.carImage.image = UIImage(named: characterItems[indexPath.row].img)
        
        return cell
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            verdachtenBordView.isHidden = true
            carouselCollectionView.isHidden = false
        case 1:
            verdachtenBordView.isHidden = false
            carouselCollectionView.isHidden = true
        default:
            break
        }
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        if charOneSelected == true || charTwoSelected == true || charThreeSelected == true || charFourSelected == true || charFiveSelected == true || charSixSelected == true {
            if wpnOneSelected == true || wpnTwoSelected == true || wpnThreeSelected == true || wpnFourSelected == true || wpnFiveSelected == true || wpnSixSelected == true {
                performSegue(withIdentifier: "submitSolution", sender: self)
            }else{
                let alert = UIAlertController(title: "Selecteer een Moordwapen!", message: "", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }else{
            let alert = UIAlertController(title: "Selecteer een Moordenaar!", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func moordenaarPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            charOne.layer.opacity = 1
            charTwo.layer.opacity = 0.3
            charThree.layer.opacity = 0.3
            charFour.layer.opacity = 0.3
            charFive.layer.opacity = 0.3
            charSix.layer.opacity = 0.3
            
            charOneSelected = true
            charTwoSelected = false
            charThreeSelected = false
            charFourSelected = false
            charFiveSelected = false
            charSixSelected = false
        } else if sender.tag == 2 {
            charOne.layer.opacity = 0.3
            charTwo.layer.opacity = 1
            charThree.layer.opacity = 0.3
            charFour.layer.opacity = 0.3
            charFive.layer.opacity = 0.3
            charSix.layer.opacity = 0.3
            
            charOneSelected = false
            charTwoSelected = true
            charThreeSelected = false
            charFourSelected = false
            charFiveSelected = false
            charSixSelected = false
        } else if sender.tag == 3 {
            charOne.layer.opacity = 0.3
            charTwo.layer.opacity = 0.3
            charThree.layer.opacity = 1
            charFour.layer.opacity = 0.3
            charFive.layer.opacity = 0.3
            charSix.layer.opacity = 0.3
            
            charOneSelected = false
            charTwoSelected = false
            charThreeSelected = true
            charFourSelected = false
            charFiveSelected = false
            charSixSelected = false
        } else if sender.tag == 4 {
            charOne.layer.opacity = 0.3
            charTwo.layer.opacity = 0.3
            charThree.layer.opacity = 0.3
            charFour.layer.opacity = 1
            charFive.layer.opacity = 0.3
            charSix.layer.opacity = 0.3
            
            charOneSelected = false
            charTwoSelected = false
            charThreeSelected = false
            charFourSelected = true
            charFiveSelected = false
            charSixSelected = false
        } else if sender.tag == 5 {
            charOne.layer.opacity = 0.3
            charTwo.layer.opacity = 0.3
            charThree.layer.opacity = 0.3
            charFour.layer.opacity = 0.3
            charFive.layer.opacity = 1
            charSix.layer.opacity = 0.3
            
            charOneSelected = false
            charTwoSelected = false
            charThreeSelected = false
            charFourSelected = false
            charFiveSelected = true
            charSixSelected = false
        } else if sender.tag == 6 {
            charOne.layer.opacity = 0.3
            charTwo.layer.opacity = 0.3
            charThree.layer.opacity = 0.3
            charFour.layer.opacity = 0.3
            charFive.layer.opacity = 0.3
            charSix.layer.opacity = 1
            
            charOneSelected = false
            charTwoSelected = false
            charThreeSelected = false
            charFourSelected = false
            charFiveSelected = false
            charSixSelected = true
        }
    }
    
    
    @IBAction func weaponSelected(_ sender: UIButton) {
        if sender.tag == 1 {
            wpnOne.layer.opacity = 1
            wpnTwo.layer.opacity = 0.3
            wpnThree.layer.opacity = 0.3
            wpnFour.layer.opacity = 0.3
            wpnFive.layer.opacity = 0.3
            wpnSix.layer.opacity = 0.3

            wpnOneSelected = true
            wpnTwoSelected = false
            wpnThreeSelected = false
            wpnFourSelected = false
            wpnFiveSelected = false
            wpnSixSelected = false
        } else if sender.tag == 2 {
            wpnOne.layer.opacity = 0.3
            wpnTwo.layer.opacity = 1
            wpnThree.layer.opacity = 0.3
            wpnFour.layer.opacity = 0.3
            wpnFive.layer.opacity = 0.3
            wpnSix.layer.opacity = 0.3

            wpnOneSelected = false
            wpnTwoSelected = true
            wpnThreeSelected = false
            wpnFourSelected = false
            wpnFiveSelected = false
            wpnSixSelected = false
        } else if sender.tag == 3 {
            wpnOne.layer.opacity = 0.3
            wpnTwo.layer.opacity = 0.3
            wpnThree.layer.opacity = 1
            wpnFour.layer.opacity = 0.3
            wpnFive.layer.opacity = 0.3
            wpnSix.layer.opacity = 0.3

            wpnOneSelected = false
            wpnTwoSelected = false
            wpnThreeSelected = true
            wpnFourSelected = false
            wpnFiveSelected = false
            wpnSixSelected = false
        } else if sender.tag == 4 {
            wpnOne.layer.opacity = 0.3
            wpnTwo.layer.opacity = 0.3
            wpnThree.layer.opacity = 0.3
            wpnFour.layer.opacity = 1
            wpnFive.layer.opacity = 0.3
            wpnSix.layer.opacity = 0.3

            wpnOneSelected = false
            wpnTwoSelected = false
            wpnThreeSelected = false
            wpnFourSelected = true
            wpnFiveSelected = false
            wpnSixSelected = false
        } else if sender.tag == 5 {
            wpnOne.layer.opacity = 0.3
            wpnTwo.layer.opacity = 0.3
            wpnThree.layer.opacity = 0.3
            wpnFour.layer.opacity = 0.3
            wpnFive.layer.opacity = 1
            wpnSix.layer.opacity = 0.3

            wpnOneSelected = false
            wpnTwoSelected = false
            wpnThreeSelected = false
            wpnFourSelected = false
            wpnFiveSelected = true
            wpnSixSelected = false
        } else if sender.tag == 6 {
            wpnOne.layer.opacity = 0.3
            wpnTwo.layer.opacity = 0.3
            wpnThree.layer.opacity = 0.3
            wpnFour.layer.opacity = 0.3
            wpnFive.layer.opacity = 0.3
            wpnSix.layer.opacity = 1

            wpnOneSelected = false
            wpnTwoSelected = false
            wpnThreeSelected = false
            wpnFourSelected = false
            wpnFiveSelected = false
            wpnSixSelected = true
        }
    }
}
