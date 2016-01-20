//
//  dia.swift
//  who can get zero
//
//  Created by swift on 16/1/19.
//  Copyright © 2016年 chensb. All rights reserved.
//


import SpriteKit

class dia {
    init(number:SKLabelNode,background:SKSpriteNode){
        self.number = number
        self.background  = background
        self.value = Int(number.text!)!
        setLabelFontColor()
    }
    var  value = 0
    var  number : SKLabelNode
    var  background : SKSpriteNode
    
    
    func setLabelFontColor(){
        switch(value){
        case 1,3,5:
            self.number.fontColor = UIColor.orangeColor()
        case 2,4,6:
            self.number.fontColor = UIColor.redColor()
        case 7,9:
            self.number.fontColor = UIColor.greenColor()
        case 8,10:
            self.number.fontColor  = UIColor.yellowColor()
        default:
            self.number.fontColor = UIColor.blackColor()
            
        }
    }
    
}