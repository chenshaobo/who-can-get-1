//
//  GameScene.swift
//  who can get zero
//
//  Created by swift on 16/1/18.
//  Copyright (c) 2016年 chensb. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    var spriteArray = [dia]()
    var diaWidth :CGFloat = 0
    var diaHeight:CGFloat = 0
    
    var touchDic = Dictionary< Int,Int>()
    var lastTouchIndex = -1
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 45;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        
//        self.addChild(myLabel)
//        let startx = self.frame.origin.x
//        let starty = self.frame.origin.y
        let width = self.frame.width
        let height = self.frame.height - 100
        
        diaWidth = width / CGFloat(ROW)
        diaHeight = height / CGFloat(COLUMN)

        
        let spritex = SKSpriteNode(imageNamed: "Tile")
        
        let xScale = diaWidth / spritex.frame.width
        let yScale = diaHeight / spritex.frame.height
        
        
        print(xScale,spritex.frame.width,diaHeight)
        for n in 0...(COLUMN - 1){
            let cgfloatN = CGFloat(n)
            for i in 0...(ROW - 1){
                let cgfloatI = CGFloat(i)
                let sprite = SKSpriteNode(imageNamed: "Tile")
                sprite.xScale = xScale
                sprite.yScale = yScale
                //postion point is the center point ,so + 0.5 scaleWidth and + 0.5 scaleheight
                
                sprite.position = CGPoint(x: (diaWidth * (cgfloatI +  0.5) + cgfloatI), y: CGFloat(SPRITE_START_Y) + cgfloatN + diaHeight * (cgfloatN + 0.5 ))
                self.addChild(sprite)
                
                let myLabel = SKLabelNode(fontNamed:"Chalkduster")
                myLabel.text = "\(get_random())";
                myLabel.fontSize = 20;
                myLabel.position = CGPoint(x:(diaWidth * (cgfloatI +  0.5) + cgfloatI), y: CGFloat(SPRITE_START_Y) + cgfloatN + diaHeight * (cgfloatN + 0.5 ));
                myLabel.horizontalAlignmentMode = .Center
                myLabel.verticalAlignmentMode = .Center
                
                sprite.userInteractionEnabled = false
                
                self.addChild(myLabel)
                spriteArray.append(dia(number: myLabel,background: sprite))
            }
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        //print("before :\(touchDic)")
        //insertTouchNumber(touches)
        print("after\(touchDic)")
        if touchDic.values.count > 1 {
        for (index,value) in touchDic{
            let dia = spriteArray[index]
            if(index == lastTouchIndex){
                dia.number.text = "\(value + 1)"
            }else{
                dia.number.text = "\(get_random())"
//                dia.number.hidden = true
            }
            }
        }
        clearRound()
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastTouchIndex = insertTouchNumber(touches)
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        insertTouchNumber(touches)
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func insertTouchNumber(touches: Set<UITouch> ) -> Int{
        var index = 0
        for touch in touches{
            let location  = touch.locationInNode(self)
            let row = Int(location.x / (diaWidth + 1))
            let column = Int(( location.y - CGFloat(SPRITE_START_Y)) / (diaHeight + 1))
            if row == 0 && column == 0{
                index = 0
            }else{
                index  = column * ROW + row
            }
        
            if lastTouchIndex == -1 {
                doInsertNumber(index)
            }else{
                switch(lastTouchIndex){
                case index + 6,index - 6:
                    doInsertNumber(index)
                
                case index - 1,index + 1:
                    if row < 6 {
                        doInsertNumber(index)
                    }
                default:
                    break
                }
            }
        }
        return index
    }
    
    func doInsertNumber(index:Int){
        let dia = spriteArray[index]
        if let number =  dia.number.text{
            let numberInt = Int(number)
        if touchDic.count == 0 {
            touchDic[ index] = numberInt
        }
        else if touchDic.values.first == numberInt{
            touchDic[ index] = numberInt
        }
        lastTouchIndex = index
        }
    }
    func clearRound(){
        touchDic = [Int:Int]()
        lastTouchIndex = -1
    }
}

func get_random() -> Int {
    var randomNum = 1
    while randomNum == 1{
        let diceFaceCount: UInt32 = 10
        randomNum = Int(arc4random_uniform(diceFaceCount)) + 1
//        print(randomNum)
    }
    return randomNum
}


