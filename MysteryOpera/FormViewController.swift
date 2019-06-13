//
//  FormViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 13/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var addButton1: UIButton!
    @IBOutlet weak var extraOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var playerTwoTextField: UITextField!
    @IBOutlet weak var addButton2: UIButton!
    @IBOutlet weak var extraTwoLabel: UILabel!
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
        extraOneLabel.isHidden = true
        addButton2.isHidden = false
        extraTwoLabel.isHidden = false
    }
    
    @IBAction func addPlayerThree(_ sender: UIButton) {
        playerThreeLabel.isHidden = false
        playerThreeTextField.isHidden = false
        addButton2.isHidden = true
        extraTwoLabel.isHidden = true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 130 //keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if playerOneTextField.text?.isEmpty ?? true {
            print("textfield empty")
        } else {
            performSegue(withIdentifier: "test", sender: nil)
        }
    }


}
