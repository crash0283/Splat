//
//  GameScene.swift
//  Splat
//
//  Created by Chris Rasch on 10/11/14.
//  Copyright (c) 2014 __Flip Flop Studios__. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        var bg = SKSpriteNode (imageNamed: "bg.png")
        bg.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 50)
        bg.size = CGSizeMake(self.frame.size.width + 400, self.frame.size.height)
        bg.zPosition = 0
        self.addChild(bg)
        
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
        dash.zPosition = 10
        self.addChild(dash)
        
        var steeringWheel = SKSpriteNode (imageNamed: "steeringWheel.png")
        steeringWheel.position = CGPointMake(self.frame.size.width / 2 - 400, self.frame.size.height / 2 - 260)
        steeringWheel.zPosition = 20
        self.addChild(steeringWheel)

        var tree = SKSpriteNode (imageNamed: "Tree.png")
        tree.position = CGPointMake(self.frame.size.width / 2 + 70, self.frame.size.height / 2)
        tree.zPosition = 15
        self.addChild(tree)
        
        var pineTree = SKSpriteNode (imageNamed: "pineTree.png")
        pineTree.position = CGPointMake(self.frame.size.width / 2 - 430, self.frame.size.height / 2)
        pineTree.zPosition = 15
        self.addChild(pineTree)
        
        var roadStripe1 = SKSpriteNode (imageNamed: "roadStripe_01")
        roadStripe1.position = CGPointMake(self.frame.size.width / 2 - 175, self.frame.size.height / 2 - 100)
        roadStripe1.zPosition = 9
        self.addChild(roadStripe1)
        
        var moveStripe = SKAction.moveByX(0, y: -100, duration: 0.3)
        var scaleStripe = SKAction.scaleTo(2, duration: 0.3)
        var groupStripe = SKAction.group([moveStripe,scaleStripe])
        var removeStripe = SKAction.removeFromParent()
        var stripeSeq = SKAction.sequence([groupStripe,removeStripe])
        var repeatStripe = SKAction.repeatActionForever(stripeSeq)
        roadStripe1.runAction(repeatStripe)
        
        
        var mirror = SKSpriteNode (imageNamed: "mirror.png")
        mirror.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 230)
        mirror.zPosition = 15
        self.addChild(mirror)
        

        

        

        
        
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
        
        
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
