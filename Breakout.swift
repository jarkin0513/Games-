//
//  Breakout.swift
//  Games
//
//  Created by period4 on 4/29/21.
//  Copyright © 2021 period4. All rights reserved.
//

import UIKit

class Breakout: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var paddle: UIView!
    @IBOutlet weak var ball: UIView!
    
    @IBOutlet weak var brickOne: UIView!
    @IBOutlet weak var brickTwo: UIView!
    @IBOutlet weak var brickThree: UIView!
    @IBOutlet weak var brickFour: UIView!
    @IBOutlet weak var brickFive: UIView!
    @IBOutlet weak var brickSix: UIView!
    @IBOutlet weak var brickEight: UIView!
    @IBOutlet weak var brickSeven: UILabel!
    @IBOutlet weak var brickNine: UILabel!
    @IBOutlet weak var brickTen: UILabel!
    @IBOutlet weak var brickEleven: UILabel!
    @IBOutlet weak var brickTwelve: UIView!
    @IBOutlet weak var brickThirteen: UIView!
    @IBOutlet weak var brickFourteen: UIView!
    @IBOutlet weak var brickFifteen: UIView!
    @IBOutlet weak var brickSixteen: UIView!
    @IBOutlet weak var brickSeventeen: UIView!
    @IBOutlet weak var brickEighteen: UIView!
    
    var dynamicAnimator : UIDynamicAnimator!
    var pushBehavior : UIPushBehavior!
    var collisionBehavior : UICollisionBehavior!
    var allBricks = [UIView]()
    var ballDynamicBehavior : UIDynamicItemBehavior!
    var padelDynamicBehavior : UIDynamicItemBehavior!
    var brickDynamicBehavior : UIDynamicItemBehavior!
    
    var brickCount = 18
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        ball.layer.cornerRadius = 15

        

        allBricks = [brickOne, brickTwo, brickThree, brickFour, brickFive, brickSix, brickSeven, brickEight, brickNine, brickTen, brickEleven, brickTwelve, brickThirteen, brickFourteen, brickFifteen,  brickSixteen, brickSeventeen, brickEighteen]
    }
    
    @IBAction func dragPaddle(_ sender: UIPanGestureRecognizer) {
        paddle.center = CGPoint(x: sender.location(in: view).x , y: paddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddle)
    
    }
    
    func dynamicBehaviors() {

        dynamicAnimator = UIDynamicAnimator(referenceView: view)

        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.7, dy: 0.7)
        pushBehavior.active = true
        pushBehavior.magnitude = 0.5
        dynamicAnimator.addBehavior(pushBehavior)

        collisionBehavior = UICollisionBehavior(items: [ball, paddle] + allBricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)

        ballDynamicBehavior = UIDynamicItemBehavior(items: [ball])
        ballDynamicBehavior.allowsRotation = true
        ballDynamicBehavior.elasticity = 0.2
        ballDynamicBehavior.friction = 0.0
        ballDynamicBehavior.resistance = 0.0
    dynamicAnimator.addBehavior(ballDynamicBehavior)

        padelDynamicBehavior = UIDynamicItemBehavior(items: [paddle])
        padelDynamicBehavior.friction = 0.0
        padelDynamicBehavior.density = 1000.0
        padelDynamicBehavior.allowsRotation = false
    dynamicAnimator.addBehavior(padelDynamicBehavior)

        brickDynamicBehavior = UIDynamicItemBehavior(items: allBricks)
        brickDynamicBehavior.allowsRotation = false
        brickDynamicBehavior.elasticity = 1
        brickDynamicBehavior.density = 10
    dynamicAnimator.addBehavior(brickDynamicBehavior)
        
        collisionBehavior.collisionDelegate = self

    }
    
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehaviors()
        sender.isHidden = true
        paddle.isHidden = false
        ball.isHidden = false
    }
    
    
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at point: CGPoint) {
        for brick in allBricks{
             if item1.isEqual(ball) && item2.isEqual(brick) {
                
                brick.isHidden = true
                collisionBehavior.removeItem(brick)
                brickCount = brickCount - 1
                print(brickCount)
                
            }
        }
    }
    
    func reset() {
                  
              }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
            if p.y > paddle.center.y {
            
                alert()
            }
        }
   
        
    func alert() {
        let losingAlert = UIAlertController(title: "Loser lol", message: "Good job moron", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game", style: .default) { (action) in
            self.reset()
         }
        losingAlert.addAction(newGameButton)
    
        present(losingAlert, animated: true, completion: nil)
     }
 
    
        
}

