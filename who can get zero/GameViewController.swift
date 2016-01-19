//
//  GameViewController.swift
//  who can get zero
//
//  Created by swift on 16/1/18.
//  Copyright (c) 2016年 chensb. All rights reserved.
//

import UIKit
import SpriteKit
class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.mainScreen().bounds
        let width = bounds.size.width
        let height = bounds.size.height
        let scene =
        GameScene(size:CGSize(width: width, height: height))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    override func prefersStatusBarHidden() -> Bool  {
        return true
    } }