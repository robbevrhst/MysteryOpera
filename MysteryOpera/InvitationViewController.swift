//
//  InvitationViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 13/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class InvitationViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToOnboarding", sender: self)
    }
    
}
