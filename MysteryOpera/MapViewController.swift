//
//  MapViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 12/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileButton.layer.cornerRadius = 0.5 * profileButton.bounds.size.width
        profileButton.clipsToBounds = true
    }

    @IBAction func QRPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToQRScanner", sender: self)
    }
    
 
    
    
}
