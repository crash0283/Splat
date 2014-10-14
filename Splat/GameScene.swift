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
    var bugsNode = SKNode()
    
    var randomNum: UInt32 = UInt32()
    var randomPlacement: UInt32 = UInt32()
    var leftRandomPlacement: UInt32 = UInt32()
    var startLabel = SKLabelNode()
    
    var emptyList: NSMutableArray = []
    
    var bugSpawnUpdate: CFTimeInterval = 0
    var lastUpdateTime: CFTimeInterval = 0
    

    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.physicsWorld.gravity = CGVector(0,-9.8)
        

        self.addChild(movingObjects)
        self.addChild(bugsNode)
        
        movingObjects.speed = 0
        bugsNode.speed = 0
        
    
        animateStripe()
        
        var bg = SKSpriteNode (imageNamed: "bg.png")
        bg.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 + 50)
        bg.size = CGSizeMake(self.frame.size.width + 400, self.frame.size.height)
        bg.zPosition = 0
        self.addChild(bg)
        
        startLabel.text = "Tap To Start"
        startLabel.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        startLabel.color = SKColor.whiteColor()
        startLabel.fontSize = 60
        startLabel.fontName = "Chalkduster"
        startLabel.zPosition = 100
        self.addChild(startLabel)
        
       

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
            tree.position = CGPointMake(self.frame.size.width / 2 + CGFloat(randomPlacement), self.frame.size.height / 2 - 50)
            tree.zPosition = 20 - CGFloat(emptyList.count)
            movingObjects.addChild(tree)
            
            var startScale = SKAction.scaleTo(0.2, duration: 0)
            var moveTree = SKAction.moveByX(5000, y: -800, duration: 12)
            var scaleTree = SKAction.scaleBy(100, duration: 15)
            var treeGrp = SKAction.group([moveTree,scaleTree])
            var treeSeq = SKAction.sequence([startScale,treeGrp,SKAction.removeFromParent()])
            tree.runAction(treeSeq)
            
            emptyList.addObject(tree)
            if emptyList.count > 15 {
                
                emptyList.removeAllObjects()
            }

            
            
        } else if randomNum == 1 {
            
            var pineTree = SKSpriteNode (imageNamed: "pineTree.png")

            pineTree.position = CGPointMake(self.frame.size.width / 2 + CGFloat(randomPlacement), self.frame.size.height / 2 - 50)
            pineTree.zPosition = 20 - CGFloat(emptyList.count)
            movingObjects.addChild(pineTree)
            
            var startScale = SKAction.scaleTo(0.2, duration: 0)
            var moveTree = SKAction.moveByX(6000, y: -800, duration: 12)
            var scaleTree = SKAction.scaleBy(150, duration: 15)
            var treeGrp = SKAction.group([moveTree,scaleTree])
            var treeSeq = SKAction.sequence([startScale,treeGrp,SKAction.removeFromParent()])
            pineTree.runAction(treeSeq)
            
            emptyList.addObject(pineTree)
            if emptyList.count > 15 {
                
                emptyList.removeAllObjects()
            }
            
            
        }


}
    
    func animateLeftTree () {
        
        
        if randomNum == 0 {
            
            var pineTree = SKSpriteNode (imageNamed: "pineTree.png")

            pineTree.position = CGPointMake(self.frame.size.width / 2 - 430 - CGFloat(leftRandomPlacement), self.frame.size.height / 2 - 50)
            pineTree.zPosition = 9
            movingObjects.addChild(pineTree)
        
            var startScale = SKAction.scaleTo(0.2, duration: 0)

            var moveTree = SKAction.moveByX(-3000, y: -1000, duration: 6)
            var scaleTree = SKAction.scaleBy(150, duration: 6)
            var treeGrp = SKAction.group([moveTree,scaleTree])
            var treeSeq = SKAction.sequence([startScale,treeGrp,SKAction.removeFromParent()])
            pineTree.runAction(treeSeq)
            
        } else if randomNum == 1 {
            
            var tree = SKSpriteNode (imageNamed: "Tree.png")

            tree.position = CGPointMake(self.frame.size.width / 2 - 400 - CGFloat(leftRandomPlacement), self.frame.size.height / 2 - 50)
            tree.zPosition = 8
            movingObjects.addChild(tree)
            
            var startScale = SKAction.scaleTo(0.2, duration: 0)

            var moveTree = SKAction.moveByX(-3000, y: -1000, duration: 6)
            var scaleTree = SKAction.scaleBy(100, duration: 6)
            var treeGrp = SKAction.group([moveTree,scaleTree])
            var treeSeq = SKAction.sequence([startScale,treeGrp,SKAction.removeFromParent()])
            tree.runAction(treeSeq)
            
            
        }
        
        
    }
    
    func bugs () {
        
        var splat = SKSpriteNode (imageNamed: "splat_02.png")
        
        var arcMax = 0.1
        
        var minSpawnX = 0
        var maxSpawnX = self.frame.size.width - 75
        
        
        var minSpawnY = self.frame.size.height / 2 - 100
        var maxSpawnY = (self.frame.size.height) - 475


        var totalSpawnX = arc4random_uniform(UInt32(maxSpawnY)) + UInt32(minSpawnY)
        var totalSpawnY = arc4random_uniform(UInt32(maxSpawnY)) + UInt32(minSpawnY)
        println("X: \(totalSpawnX) Y: \(totalSpawnY)")

        splat.position = CGPointMake(CGFloat(totalSpawnX) ,CGFloat(totalSpawnY))

        splat.zPosition = 29
        splat.alpha = 1
        
        splat.physicsBody = SKPhysicsBody()
        splat.physicsBody?.dynamic = false
        
        
        splat.name = "splat" + String(arc4random())
        var randAngle = arc4random_uniform(90)
        var randSize = arc4random_uniform(2) + 1
        //print(randSize)
        
        var changeColor = SKAction.colorizeWithColor(SKColor.blackColor(), colorBlendFactor: 0.5, duration: 5)
        var randRotation = SKAction.rotateByAngle(CGFloat(randAngle), duration: 0)
        var randScale = SKAction.scaleTo(1.5, duration: 0)
        
        var splatGrp = SKAction.group([randRotation,randScale,changeColor])
        splat.runAction(splatGrp)

        
        bugsNode.addChild(splat)
        //println(splat)
        
        
        
        
        
    }
    


    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        movingObjects.speed = 1
        bugsNode.speed = 1
        startLabel.alpha = 0
        
        
    }
    
    
    func updateWithTimeSinceLastUpdate(timeSinceLastUpdate: CFTimeInterval) {
        
        bugSpawnUpdate += timeSinceLastUpdate
        
        if (bugSpawnUpdate > 2) {
            
            bugSpawnUpdate = 0
            
            bugs()
        }
    }
    

   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if movingObjects.speed != 0 && bugsNode.speed != 0 {
            
        
            randomNum = arc4random_uniform(10)
            randomPlacement = arc4random_uniform(10)
            leftRandomPlacement = arc4random_uniform(10)
            //println(randomNum)
        
            var random = arc4random_uniform(10)

            if random == 1 {
                animateRightTree()
            
            } else if random == 5 {
            
                animateLeftTree()
            }
            
        }
        
        var timeSinceLastUpdate = currentTime - lastUpdateTime
        
        if movingObjects.speed != 0 && bugsNode.speed != 0 {
        
            lastUpdateTime = currentTime
            if timeSinceLastUpdate > 1 {
                timeSinceLastUpdate = 1.0 / 60.0
                lastUpdateTime = currentTime
            }
            updateWithTimeSinceLastUpdate(timeSinceLastUpdate)
        }
        
    }
}
