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
        bg.position = CGPointMake(self.frame.size.width / 2 + 100, self.frame.size.height / 2)
        bg.size = CGSizeMake(self.frame.size.width + 400, self.frame.size.height)
        self.addChild(bg)
        
        var cloud1 = SKSpriteNode (imageNamed: "clouds_01.png")
        cloud1.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 100)
        self.addChild(cloud1)
        
        /*var cloud1move = SKAction.moveByX(10000, y: 0, duration: 10000)
        cloud1.runAction(cloud1move)*/
        
        var cloud2 = SKSpriteNode (imageNamed: "clouds_02.png")
        cloud2.position = CGPointMake(self.frame.size.width / 2 + 200, self.frame.size.height / 2 + 100)
        self.addChild(cloud2)
        
        /*var cloud2move = SKAction.moveByX(-10000, y: 0, duration: 5000)
        cloud2.runAction(cloud2move)*/
        
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
        
        
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
