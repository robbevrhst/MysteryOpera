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
        selectedChar.image = UIImage(named: "Franco")
        selectedName.text = "Franco"
        selectedVoordeel.text = "Dankzij je arendsoog kan jij de omgeving beter analyseren en zo tot extra hints bekomen."
    }
    
    @IBAction func charTwoPressed(_ sender: Any) {
        selectedChar.image = UIImage(named: "Vladimir")
        selectedName.text = "Vladimir"
        selectedVoordeel.text = "Constant gehaast en altijd bezig. Jij begint het spel met 5 minuten extra waardoor je aan een hogere score zal komen."
    }
    
    @IBAction func charThreePressed(_ sender: UIButton) {
        selectedChar.image = UIImage(named: "Arnoud")
        selectedName.text = "Arnoud"
        selectedVoordeel.text = "Door je adelijke stand krijg je toegang tot meerdere kamers, terwijl anderen eerst om de sleutel moeten zoeken."
    }
    @IBAction func charFourPressed(_ sender: UIButton) {
        selectedChar.image = UIImage(named: "Elisabeth")
        selectedName.text = "Elisabeth"
        selectedVoordeel.text = "Jij kan meer informatie uit bepaalde verdachten krijgen, dankzij je ongewone communicatie vaardigheden."
    }
    @IBAction func charFivePressed(_ sender: UIButton) {
        selectedChar.image = UIImage(named: "Imma")
        selectedName.text = "Imma"
        selectedVoordeel.text = "Extra clues voor jou."
    }
    @IBAction func charSixPressed(_ sender: UIButton) {
        selectedChar.image = UIImage(named: "Fiona")
        selectedName.text = "Fiona"
        selectedVoordeel.text = "Je krijgt meer toegang tot kamers."
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToOnboarding", sender: self)
    }
}
