//
//  ViewController.swift
//  Games
//
//  Created by period4 on 4/5/21.
//  Copyright © 2021 period4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    var allLabels: [UILabel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        turnLabel.text = "X"

        allLabels = [labelOne, labelTwo, labelThree, labelFour, labelFive, labelSix, labelSeven, labelEight, labelNine]
    }
    
@IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        
        let selectedPoint = sender.location(in: view)
        for label in allLabels
        {
            if label.frame.contains(selectedPoint)
            {
                placeInToLabel(myLabel: label)
            }
        }
        checkForWinner()
    }
   
    func placeInToLabel(myLabel: UILabel) {
        if myLabel.text == "" {
            if turnLabel.text == "X" {
            myLabel.text = turnLabel.text
            turnLabel.text = "O"
        }
      else {
            myLabel.text = turnLabel.text
            turnLabel.text = "X"
           }
        }
    }
    
    func checkForWinner() {
        if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text && labelOne.text != "" {
    alert()
        }
        if labelFour.text == labelOne.text && labelFour.text == labelSeven.text && labelOne.text != "" {
    alert()
        }
        if labelOne.text == labelFive.text && labelFive.text == labelNine.text && labelOne.text != "" {
    alert()
        }
        if labelFour.text == labelFive.text && labelFive.text == labelSix.text && labelFour.text != "" {
            alert()
        }
        if labelSeven.text == labelEight.text && labelEight.text == labelNine.text && labelEight.text != "" {
    alert()
        }
        if labelTwo.text == labelFive.text && labelFive.text == labelEight.text && labelTwo.text != "" {
    alert()
        }
        if labelThree.text == labelSix.text && labelSix.text == labelNine.text && labelThree.text != "" {
    alert()
        }
        if labelThree.text == labelFive.text && labelFive.text == labelSeven.text && labelThree.text != "" {
            alert()
        }
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
     reset()
    }
    
    
    func reset() {
        
        for label in allLabels {
             label.text = ""
        }
    }
    
    func alert() {
        let winningAlert = UIAlertController(title: "Winner!", message: "Good job!", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game", style: .default) { (action) in self.reset()
        }
    winningAlert.addAction(newGameButton)
    
        present(winningAlert, animated: true, completion: nil)
    }
    
    // This was supposed to be a function that reset the board and started a new game if there was a stalemate.
   func staleMate() {
          if (labelOne.text != "") && (labelTwo.text != "") && (labelThree.text != "") && (labelFour.text != "") && (labelFive.text != "") && (labelSix.text != "") && (labelSeven.text != "") && (labelEight.text != "") && (labelNine.text != "")
          {
              let tieAlert = UIAlertController(title: "Issa Tie!", message: "Try Again!", preferredStyle: .alert)
              let newGameButton = UIAlertAction(title: "New Game", style: .default) { (action) in self.reset()
                  
                } 
              tieAlert.addAction(newGameButton)
              
              present(tieAlert, animated: true, completion: nil)
          }
                    }

}



