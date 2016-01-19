//
//  GameScene.swift
//  who can get zero
//
//  Created by swift on 16/1/18.
//  Copyright (c) 2016年 chensb. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 45;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        
//        self.addChild(myLabel)
        let startx = self.frame.origin.x
        let starty = self.frame.origin.y
        let width = self.frame.width
//        let height = self.frame.height
        
        let scaleWidth = width / CGFloat(ROW)

        let sprite = SKSpriteNode(imageNamed: "backgroundDia")
        
        var xScale :CGFloat 
        if sprite.frame.width > scaleWidth {
            xScale = scaleWidth / sprite.frame.width
            
        }else{
            xScale = sprite.frame.width / scaleWidth
        }
        
        let scaleHeight = sprite.frame.height * xScale
        
        print(startx,starty,CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)), xScale,sprite.frame.width,scaleWidth)
        for i in 0...(ROW-1){
            for n in 0...(COLUMN - 1){
                let sprite = SKSpriteNode(imageNamed: "backgroundDia")
                sprite.xScale = xScale
                sprite.yScale = xScale
                //postion point is the center point ,so + 0.5 scaleWidth and + 0.5 scaleheight
                sprite.position = CGPoint(x: scaleWidth * (CGFloat(i) +  0.5) , y:50 + scaleHeight * (CGFloat(n) + 0.5 ))
                let myLabel = SKLabelNode(fontNamed:"Chalkduster")
                myLabel.text = "\(get_random())";
                myLabel.fontSize = 20;
                myLabel.position = CGPoint(x:scaleWidth * (CGFloat(i) +  0.5), y:50 + scaleHeight * (CGFloat(n) + 0.5 ));
                myLabel.color = UIColor.blackColor()
                self.addChild(sprite)
                self.addChild(myLabel)
            }
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
//        for touch in touches {
//            print("touches \(touch.locationInNode(self))")
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

func get_random() -> Int {
    var randomNum = 1
    while randomNum == 1{
        let diceFaceCount: UInt32 = 20
        randomNum = Int(arc4random_uniform(diceFaceCount)) + 1
        print(randomNum)
    }
    return randomNum
}
