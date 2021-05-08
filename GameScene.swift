//
//  GameScene.swift
//  AngryBirds
//
//  Created by Burak Karakoç on 26.04.2020.
//  Copyright © 2020 Burak Karakoç. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var skeleton = SKSpriteNode()
    var bird = SKSpriteNode()
    var monster = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    
    
    var gameStarted = false
    
    var originalPosition : CGPoint?
    var box1Position : CGPoint?
    var box2Position : CGPoint?
    var box3Position : CGPoint?
    var box4Position : CGPoint?
    var box5Position : CGPoint?
    var monsterPosition : CGPoint?

    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType : UInt32 {
        
        case bird = 1
        case box = 2
        case monster = 4
        
    }
    
    override func didMove(to view: SKView) {
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
       
        
        
        let texture = SKTexture(imageNamed: "bird")
        bird.name = "bird"
        bird = SKSpriteNode(texture: texture)
        bird.position = CGPoint(x: -frame.width / 3.2 , y: -frame.height / 4.2)
        bird.size = CGSize(width: frame.width / 16, height: frame.height / 8.5)
        bird.zPosition = 1
        self.addChild(bird)
        originalPosition = bird.position
        
        
        
        
        let textureM = SKTexture(imageNamed: "monster")
        monster.name = "monster"
        monster = SKSpriteNode(texture: textureM)
        monster.position = CGPoint(x: frame.width / 2.35, y: frame.height / -2.4)
        monster.size = CGSize(width: frame.width / 16, height: frame.height / 10)
        monster.zPosition = 1
        monsterPosition = monster.position
        self.addChild(monster)
        
        monster.physicsBody?.collisionBitMask = ColliderType.box.rawValue
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: texture.size().height/17.7)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.5
        
        let sizeM = CGSize(width: frame.width / 16, height: frame.height / 10)
        monster.physicsBody = SKPhysicsBody(rectangleOf: sizeM)
        monster.physicsBody?.affectedByGravity = false
        monster.physicsBody?.isDynamic = true
        monster.physicsBody?.mass = 0.4
        
        monster.physicsBody?.contactTestBitMask = ColliderType.monster.rawValue
        monster.physicsBody?.categoryBitMask = ColliderType.monster.rawValue
        monster.physicsBody?.collisionBitMask = ColliderType.box.rawValue
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let sizeBoxes = CGSize(width: boxTexture.size().width / 5, height: boxTexture.size().width / 5)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: sizeBoxes)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.5
        box1Position = box1.position
        
        box1.physicsBody?.collisionBitMask = ColliderType.monster.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: sizeBoxes)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.5
        box2Position = box2.position
        
        box2.physicsBody?.collisionBitMask = ColliderType.monster.rawValue

        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: sizeBoxes)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.5
        box3Position = box3.position
        
        box3.physicsBody?.collisionBitMask = ColliderType.monster.rawValue

        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: sizeBoxes)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.5
        box4Position = box4.position
        
        box4.physicsBody?.collisionBitMask = ColliderType.monster.rawValue

        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: sizeBoxes)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.5
        box5Position = box5.position
        
        box5.physicsBody?.collisionBitMask = ColliderType.monster.rawValue
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: frame.height/4)
        scoreLabel.zPosition = 3
        self.addChild(scoreLabel)
        

        
        
        
        
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == ColliderType.box.rawValue || contact.bodyB.collisionBitMask == ColliderType.monster.rawValue {
            monster.physicsBody?.affectedByGravity = true
            score += 1
            scoreLabel.text = String(score)
            
            
            
        }
        
    }
        
        
       
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        box1.physicsBody?.affectedByGravity = true
        box2.physicsBody?.affectedByGravity = true
        box3.physicsBody?.affectedByGravity = true
        box4.physicsBody?.affectedByGravity = true
        box5.physicsBody?.affectedByGravity = true
        bird.physicsBody?.affectedByGravity = false
        /*bird.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 400)) */
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty != true {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                            
                        }
                        
                    }
                }
                
            }
            
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty != true {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                            
                        }
                        
                    }
                }
                
            }
            
        }
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty != true {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird {
                                let dx = -4.2*(touchLocation.x - originalPosition!.x)
                                let dy = -4.2*(touchLocation.y - originalPosition!.y)
                                
                                bird.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
                                bird.physicsBody?.affectedByGravity = true
                                gameStarted = true
                                
                                
                            }
                            
                        }
                        
                    }
                }
                
            }
            
        }
        
        
       
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if let birdPhysics = bird.physicsBody {
            if birdPhysics.velocity.dx <= 1 && birdPhysics.velocity.dy <= 1 && birdPhysics.angularVelocity <= 1 && gameStarted == true {
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.position = originalPosition!
                bird.zPosition = 1
                bird.physicsBody?.friction = 2
                box1.position = box1Position!
                box2.position = box2Position!
                box3.position = box3Position!
                box4.position = box4Position!
                box5.position = box5Position!
                monster.position = monsterPosition!
                gameStarted = false
                
                
                
                
            }
        }
        
    }
}
