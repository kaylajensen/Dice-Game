//
//  ViewController.swift
//  DiceGame
//
//  Created by Kayla Jensen on 6/22/16.
//  Copyright © 2016 Kayla Jensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var playerOne: String = "Kayla"
    var playerTwo: String = "Corbin"
    var diceOneImage: UIImageView!
    var diceTwoImage: UIImageView!
    var randomOne: Int = 0
    var randomTwo: Int = 0
    
    @IBOutlet weak var rollDiceButtonOutlet: UIButton!
    @IBOutlet weak var diceTotalLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var betString: UITextField!
    
    @IBAction func placeBetButton(sender: AnyObject) {
        if betString.text != "" {
            
            print("Bet: \(betString.text)")
            betString.enabled = false
            betString.resignFirstResponder()
            
        }
        else {
            print("There is no bet")
        }
    }
    
    @IBAction func rollDiceButton(sender: AnyObject) {
        if betString.text != "" {
            //allow to roll the dice
            
            diceGame()
            
            //rollDiceButtonOutlet.enabled = false
            
            if randomOne+randomTwo == 7 {
                //rolled a 7
                //send bet
                
                print("\(playerTwo), \(playerOne) rolled a 7 and now you must \(betString.text!)!")
                
                // create the alert
                let alert = UIAlertController(title: "Barstool Bets", message: "Sending \(playerTwo) your bet, \"\(betString.text!)\"!", preferredStyle: UIAlertControllerStyle.Alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                // show the alert
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            else if Float(randomOne)/Float(randomTwo) == 1.0 {
                //doubles
                //sender does their own bet
                print("\(playerOne), burn! You must now complete your own bet, \(betString.text!)!")
                
                // create the alert
                let alert = UIAlertController(title: "Barstool Bets", message: playerOne + ", burn! You must now complete your own bet, \"\(betString.text!)\"!", preferredStyle: UIAlertControllerStyle.Alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                // show the alert
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            else {
                //send nothing
                print("\(playerOne), better luck next roll!")
                
                // create the alert
                let alert = UIAlertController(title: "Barstool Bets", message: playerOne + ", better luck next roll!", preferredStyle: UIAlertControllerStyle.Alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                // show the alert
                self.presentViewController(alert, animated: true, completion: nil)
            
            }
            
        }
        else {
            print("Please place a bet first")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.betString.delegate = self
        
        nameLabel.text = playerTwo + "..."
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "wood-pattern.jpg")
        self.view.insertSubview(backgroundImage, atIndex: 0)

        
        diceOneImage = UIImageView(image: UIImage(named: "dice4.png"))
        diceOneImage.frame = CGRectMake(self.view.bounds.size.width/5, self.view.bounds.size.height/2, 100, 100)
        diceTwoImage = UIImageView(image: UIImage(named: "dice3.png"))
        diceTwoImage.frame = CGRectMake(self.view.bounds.size.width/1.8, self.view.bounds.size.height/2, 100, 100)
        
        self.view.addSubview(diceTwoImage)
        self.view.addSubview(diceOneImage)
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func diceGame() {
        randomOne = Int(arc4random_uniform(6))
        randomTwo = Int(arc4random_uniform(6))
        print("the random numbers are \(randomOne+1) and \(randomTwo+1)")
        
        randomOne+=1
        randomTwo+=1
        let stringOne = "dice" + String(randomOne) + ".png"
        let stringTwo = "dice" + String(randomTwo) + ".png"
        print("stringOne: \(stringOne) stringTwo: \(stringTwo)")
        
        diceOneImage = UIImageView(image: UIImage(named: stringOne))
        diceOneImage.frame = CGRectMake(self.view.bounds.size.width/5, self.view.bounds.size.height/2, 100, 100)
        diceTwoImage = UIImageView(image: UIImage(named: stringTwo))
        diceTwoImage.frame = CGRectMake(self.view.bounds.size.width/1.8, self.view.bounds.size.height/2, 100, 100)
        self.view.addSubview(diceTwoImage)
        self.view.addSubview(diceOneImage)
        
        diceTotalLabel.text = "Total: " + String(randomOne+randomTwo)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

