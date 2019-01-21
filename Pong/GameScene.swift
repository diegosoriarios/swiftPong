//
//  GameScene.swift
//  Pong
//
//  Created by diego.rios on 21/01/19.
//  Copyright © 2019 diego.rios. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    var enemyPoint = SKLabelNode(fontNamed: "ArialMT")
    var mainPoint = SKLabelNode(fontNamed: "ArialMT")
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1))
        if(ball.position.y < -580){
            var value = Int(enemyPoint.text!)!
            value += 1
            enemyPoint.text  = "Points: " + String(value)
            enemyPoint.position = CGPoint(x: -300, y:620)
        }else if(ball.position.y > 580){
            var value = Int(mainPoint.text!)!
            value += 1
            mainPoint.text  = "Points: " + String(value)
            mainPoint.position = CGPoint(x: -300, y: -620)
        }
    }
}
