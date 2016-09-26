//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Andre Dias on 23/09/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//
import GameplayKit
import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTaped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }else{
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score \(score).", preferredStyle: .alert )
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

