//
//  VerdachtenViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 12/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit
import iCarousel

class VerdachtenViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {

    @IBOutlet weak var carouselView: UIView!
    
    var numbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numbers = [1,2,3,4,5,6]
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return numbers.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        tempView.backgroundColor = UIColor.blue
        
        return tempView
    }
    
}
