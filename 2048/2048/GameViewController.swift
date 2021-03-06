//
//  GameViewController.swift
//  2048
//
//  Created by Дмитрий on 05.06.14.
//  Copyright (c) 2014 rdmv. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        
        let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks")
        
        var sceneData = NSData.dataWithContentsOfFile(path, options: .DataReadingMappedIfSafe, error: nil)
        var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
        
        archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
        let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
        archiver.finishDecoding()
        return scene
    }
}

class GameViewController: UIViewController {
    var _scene : GameScene?

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var swipeRightRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("moveRight:"))
        swipeRightRecognizer.direction = .Right
        self.view.addGestureRecognizer(swipeRightRecognizer)
        
        var swipeLeftRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("moveLeft:"))
        swipeLeftRecognizer.direction = .Left
        self.view.addGestureRecognizer(swipeLeftRecognizer)
        
        var swipeUpRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("moveUp:"))
        swipeUpRecognizer.direction = .Up
        self.view.addGestureRecognizer(swipeUpRecognizer)
        
        var swipeDownRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("moveDown:"))
        swipeDownRecognizer.direction = .Down
        self.view.addGestureRecognizer(swipeDownRecognizer)

    
        // Configure the view.
        let skView = self.view as SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        let scene = GameScene.sceneWithSize(skView.bounds.size)
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        self._scene = scene
        
        skView.presentScene(scene)
        
    }

    override func shouldAutorotate() -> Bool {
        return false
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
        } else {
            return Int(UIInterfaceOrientationMask.All.toRaw())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func moveRight(swipe:UISwipeGestureRecognizer) {
        self._scene!.moveRight()
    }
    
    func moveLeft(swipe:UISwipeGestureRecognizer) {
        self._scene!.moveLeft()
    }
    
    func moveUp(swipe:UISwipeGestureRecognizer) {
        self._scene!.moveUp()
    }
    
    func moveDown(swipe:UISwipeGestureRecognizer) {
        self._scene!.moveDown()
    }
    
}
