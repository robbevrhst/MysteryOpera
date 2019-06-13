//
//  ViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 09/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToForm", sender: nil)
    }
    
}

