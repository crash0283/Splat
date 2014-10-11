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
        
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
        
        
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
