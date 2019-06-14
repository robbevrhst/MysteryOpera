//
//  SolutionViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 14/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class SolutionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLeaderboard", sender: self)
    }
    

}
