//
//  CharacterViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 12/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var selectedChar: UIImageView!
    @IBOutlet weak var selectedName: UILabel!
    @IBOutlet weak var selectedVoordeel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10
        
        characterOnePressed(.init())
    }
    
    @IBAction func characterOnePressed(_ sender: UIButton) {
        selectedChar.image = UIImage(named: "personage1")
        selectedName.text = "Personage 1"
        selectedVoordeel.text = "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
    }
    
    @IBAction func charTwoPressed(_ sender: Any) {
        selectedChar.image = UIImage(named: "personage2")
        selectedName.text = "Personage 2"
        selectedVoordeel.text = "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToInvitation", sender: self)
    }
}
