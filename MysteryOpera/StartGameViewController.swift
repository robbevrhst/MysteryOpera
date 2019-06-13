//
//  StartGameViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 10/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {

    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var seconds = 59
    var minutes = 59
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
    }
    
    @objc func action (){
        if seconds <= 0 {
            seconds = 60
            minutes -= 1
            minutesLabel.text = String(minutes)
        }
    
        if minutes <= 59 && seconds <= 58 {
            minutesLabel.text = "time"
            secondsLabel.text = "up"
        } else {
            seconds -= 1
            secondsLabel.text = String(seconds)
        }
    }

    @IBAction func startGamePressed(_ sender: UIButton) {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(StartGameViewController.action), userInfo: nil, repeats: true)
        
        performSegue(withIdentifier: "startGame", sender: self)
    }
}
