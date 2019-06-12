//
//  ViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 09/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerOneLabel: UITextField!
    @IBOutlet weak var addButton1: UIButton!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var playerTwoTextField: UITextField!
    @IBOutlet weak var addButton2: UIButton!
    @IBOutlet weak var playerThreeLabel: UILabel!
    @IBOutlet weak var playerThreeTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction func addPlayerTwo(_ sender: UIButton) {
        playerTwoLabel.isHidden = false
        playerTwoTextField.isHidden = false
        addButton1.isHidden = true
        addButton2.isHidden = false
    }

    @IBAction func addPlayerThree(_ sender: UIButton) {
        playerThreeLabel.isHidden = false
        playerThreeTextField.isHidden = false
        addButton2.isHidden = true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 250 //keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if playerOneLabel.text?.isEmpty ?? true {
            print("textField is empty")
        } else {
            print("textField has some text")
            performSegue(withIdentifier: "goToCharacterSelect", sender: self)
        }
    }
}

