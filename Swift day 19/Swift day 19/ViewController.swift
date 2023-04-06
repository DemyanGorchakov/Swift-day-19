//
//  ViewController.swift
//  Swift day 19
//
//  Created by Демьян Горчаков on 04.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonFlag1: UIButton!
    @IBOutlet weak var buttonFlag2: UIButton!
    @IBOutlet weak var buttonFlag3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonFlag1.layer.borderWidth = 1
        buttonFlag2.layer.borderWidth = 1
        buttonFlag3.layer.borderWidth = 1
        
        buttonFlag1.layer.borderColor = UIColor.lightGray.cgColor
        buttonFlag2.layer.borderColor = UIColor.lightGray.cgColor
        buttonFlag3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion(acttion: nil)
    }
    
    func askQuestion(acttion: UIAlertAction!) {
        countries.shuffle()
        buttonFlag1.setImage(UIImage(named: countries[0]), for: .normal)
        buttonFlag2.setImage(UIImage(named: countries[1]), for: .normal)
        buttonFlag3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }
        
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score += 1
            title = "Currect 🥳"
            if score == 3 {
                title = "Apologize !!!"
            }
        } else {
            score -= 1
            title = "Wrong 🙁. It's \(countries.first!.uppercased())"
        }
        
        let alertControl = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        alertControl.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertControl, animated: true)
    }
    
}

