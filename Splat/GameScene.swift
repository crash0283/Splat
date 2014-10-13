//
//  GameScene.swift
//  Splat
//
//  Created by Chris Rasch on 10/11/14.
//  Copyright (c) 2014 __Flip Flop Studios__. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var movingObjects = SKNode()
    var randomNum: UInt32 = UInt32()
    var randomPlacement: UInt32 = UInt32()
    var leftRandomPlacement: UInt32 = UInt32()


    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.addChild(movingObjects)
        movingObjects.speed = 0
        
        animateStripe()
        //animateTree()
        
        var bg = SKSpriteNode (imageNamed: "bg.png")
        bg.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 50)
        bg.size = CGSizeMake(self.frame.size.width + 400, self.frame.size.height)
        bg.zPosition = 0
        self.addChild(bg)
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
       

            var cloud1 = SKSpriteNode (imageNamed: "clouds_01.png")
            cloud1.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 100)
            cloud1.zPosition = 1
            self.addChild(cloud1)
        
            /*var cloud1move = SKAction.moveByX(10000, y: 0, duration: 10000)
            cloud1.runAction(cloud1move)*/
        
            var cloud2 = SKSpriteNode (imageNamed: "clouds_02.png")
            cloud2.position = CGPointMake(self.frame.size.width / 2 + 200, self.frame.size.height / 2 + 100)
            cloud2.zPosition = 2
            self.addChild(cloud2)
        
            /*var cloud2move = SKAction.moveByX(-10000, y: 0, duration: 5000)
            cloud2.runAction(cloud2move)*/
        
            var dash = SKSpriteNode (imageNamed: "dash.png")
            dash.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 - 280)
            dash.zPosition = 40
            self.addChild(dash)
        
            var steeringWheel = SKSpriteNode (imageNamed: "steeringWheel.png")
            steeringWheel.position = CGPointMake(self.frame.size.width / 2 - 400, self.frame.size.height / 2 - 260)
            steeringWheel.zPosition = 50
            self.addChild(steeringWheel)

        
        
            var mirror = SKSpriteNode (imageNamed: "mirror.png")
            mirror.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 230)
            mirror.zPosition = 31
            self.addChild(mirror)
            
            var windshield = SKSpriteNode (imageNamed: "windshield.png")
            windshield.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 60)
            windshield.alpha = 0.4
            windshield.zPosition = 30
            self.addChild(windshield)
            
        } else if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            
            var cloud1 = SKSpriteNode (imageNamed: "clouds_01.png")
            cloud1.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 200)
            cloud1.zPosition = 1
            self.addChild(cloud1)
            
            /*var cloud1move = SKAction.moveByX(10000, y: 0, duration: 10000)
            cloud1.runAction(cloud1move)*/
            
            var cloud2 = SKSpriteNode (imageNamed: "clouds_02.png")
            cloud2.position = CGPointMake(self.frame.size.width / 2 + 200, self.frame.size.height / 2 + 200)
            cloud2.zPosition = 2
            self.addChild(cloud2)
            
            /*var cloud2move = SKAction.moveByX(-10000, y: 0, duration: 5000)
            cloud2.runAction(cloud2move)*/
            
            var dash = SKSpriteNode (imageNamed: "dash.png")
            dash.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 - 380)
            dash.zPosition = 15
            self.addChild(dash)
            
            var steeringWheel = SKSpriteNode (imageNamed: "steeringWheel.png")
            steeringWheel.position = CGPointMake(self.frame.size.width / 2 - 400, self.frame.size.height / 2 - 360)
            steeringWheel.zPosition = 20
            self.addChild(steeringWheel)
            
            
            
            var mirror = SKSpriteNode (imageNamed: "mirror.png")
            mirror.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 330)
            mirror.zPosition = 15
            self.addChild(mirror)

            
            
            
            
        }
        

        
        
    }
    
    
    func animateStripe () {
        

            var roadStripe1 = SKSpriteNode (imageNamed: "roadStripe_01")
            roadStripe1.position = CGPointMake(self.frame.size.width / 2 - 175, self.frame.size.height / 2 - 120)
            roadStripe1.zPosition = 9
            movingObjects.addChild(roadStripe1)
        
            var startScale = SKAction.scaleTo(0.75, duration: 0)
            var moveStripe = SKAction.moveByX(0, y: -300, duration: 0.5)
            var scaleStripe = SKAction.scaleTo(5, duration: 0.5)
            var replaceStripe = SKAction.moveByX(0, y: 300, duration: 0)
            var replaceScale = SKAction.scaleTo(0.02, duration: 0)
            var groupStripe = SKAction.group([moveStripe,scaleStripe])
            var startStripeSeq = SKAction.sequence([startScale,groupStripe])

            var repeatStripe = SKAction.repeatActionForever(SKAction.sequence([startStripeSeq,replaceStripe]))
            roadStripe1.runAction(repeatStripe)
        
        
        
    }

    func animateRightTree () {

        
        if randomNum == 0 {
            
            var tree = SKSpriteNode (imageNamed: "Tree.png")
            tree.position = CGPointMake(self.frame.size.width / 2 + CGFloat(randomPlacement), self.frame.size.height / 2 + 30)
            tree.zPosition = 9
            movingObjects.addChild(tree)
        
            var moveTree = SKAction.moveByX(3000, y: -1000, duration: 3)
            var scaleTree = SKAction.scaleBy(10, duration: 3)
            var treeGrp = SKAction.group([moveTree,scaleTree])
            var treeSeq = SKAction.sequence([treeGrp,SKAction.removeFromParent()])
            tree.runAction(treeSeq)
            
            
        } else if randomNum == 1 {
            
            var pineTree = SKSpriteNode (imageNamed: "pineTree.png")

            pineTree.position = CGPointMake(self.frame.size.width / 2 + CGFloat(randomPlacement), self.frame.size.height / 2 + 30)
            pineTree.zPosition = 8
            movingObjects.addChild(pineTree)
            
            var moveTree = SKAction.moveByX(3000, y: -1000, duration: 3)
            var scaleTree = SKAction.scaleBy(10, duration: 3)
            var treeGrp = SKAction.group([moveTree,scaleTree])
            var treeSeq = SKAction.sequence([treeGrp,SKAction.removeFromParent()])
            pineTree.runAction(treeSeq)
            
            
        }


}
    
    func animateLeftTree () {
        
        
        if randomNum == 0 {
            
            var pineTree = SKSpriteNode (imageNamed: "pineTree.png")

            pineTree.position = CGPointMake(self.frame.size.width / 2 - 430 - CGFloat(leftRandomPlacement), self.frame.size.height / 2 + 40)
            pineTree.zPosition = 9
            movingObjects.addChild(pineTree)
        
            var moveTree = SKAction.moveByX(-6000, y: -800, duration: 5)
            var scaleTree = SKAction.scaleBy(5, duration: 0.5)
            var treeGrp = SKAction.group([moveTree,scaleTree])
            var treeSeq = SKAction.sequence([treeGrp,SKAction.removeFromParent()])
            pineTree.runAction(treeSeq)
            
        } else if randomNum == 1 {
            
            var tree = SKSpriteNode (imageNamed: "Tree.png")

            tree.position = CGPointMake(self.frame.size.width / 2 - 330 - CGFloat(leftRandomPlacement), self.frame.size.height / 2 + 40)
            tree.zPosition = 8
            movingObjects.addChild(tree)
            
            var moveTree = SKAction.moveByX(-6000, y: -800, duration: 5)
            var scaleTree = SKAction.scaleBy(3, duration: 0.5)
            var treeGrp = SKAction.group([moveTree,scaleTree])
            var treeSeq = SKAction.sequence([treeGrp,SKAction.removeFromParent()])
            tree.runAction(treeSeq)
            
            
        }
        
        
    }

    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        movingObjects.speed = 1
        
        
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if movingObjects.speed != 0 {
        
            randomNum = arc4random_uniform(10)
            randomPlacement = arc4random_uniform(200)
            leftRandomPlacement = arc4random_uniform(200)
            //println(randomNum)
        
            var random = arc4random_uniform(3)

            if random == 1 {
                animateRightTree()
            
            } else if random == 2 {
            
                animateLeftTree()
            }
            
        }
    
        
    }
}
