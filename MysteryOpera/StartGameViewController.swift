//
//  StartGameViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 10/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {
    
    let date = Date()
    let calendar = Calendar.current
    
    var startUur:Int = 0
    var startMinuten:Int = 0
    var startSeconden:Int = 0
    
    var currentUur:Int = 0
    var currentMinuten:Int = 0
    var currentSeconden:Int = 0

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        
        startUur = calendar.component(.hour, from: date)
        startMinuten = calendar.component(.minute, from: date)
        startSeconden = calendar.component(.second, from: date)
        
        print("START -- \(startUur) hours, \(startMinuten) minutes, \(startSeconden) seconds")
    }
    
    

    @IBAction func startGamePressed(_ sender: UIButton) {
        let dateCurrent = Date()
        let CalenderCurrent = Calendar.current
        
        currentUur = CalenderCurrent.component(.hour, from: dateCurrent)
        currentMinuten = CalenderCurrent.component(.minute, from: dateCurrent)
        currentSeconden = CalenderCurrent.component(.second, from: dateCurrent)
        
        print("CURRENT -- \(currentUur) hours, \(currentMinuten) minutes, \(currentSeconden) seconds")
        
        let endUur = startUur + 1
        
        print("END -- \(endUur) hours, \(startMinuten) minutes, \(startSeconden) seconds")
        
        var hoursRemaining = endUur - currentUur
        var minutesRemaining = startMinuten - currentMinuten
        var secondsRemaining = startSeconden - currentSeconden
        
        if hoursRemaining >= 1 && minutesRemaining <= 0 && secondsRemaining <= 0 {
            hoursRemaining -= 1
            minutesRemaining = 59
            secondsRemaining = 59
        } else if minutesRemaining >= 0 && secondsRemaining <= 0 {
            minutesRemaining -= 1
            secondsRemaining = 59
        } else if minutesRemaining <= 0 && secondsRemaining <= 0 {
            print("TIME IS UP")
        } else {
            print("SOMETHING WRONG LMAO")
        }
        
        print("\(hoursRemaining) hours, \(minutesRemaining) minutes, \(secondsRemaining) seconds remaining...")
        
        performSegue(withIdentifier: "startGame", sender: self)
    }
}
