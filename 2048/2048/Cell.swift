//
//  Cell.swift
//  2048
//
//  Created by Дмитрий on 07.06.14.
//  Copyright (c) 2014 rdmv. All rights reserved.
//

import Foundation
import SpriteKit


class Cell : GameRect {
    var _number: Int = 2
    var _size: CGFloat = 0
    
    var number: Int {
    get {
        return self._number
    }
    set (newNumber) {
        self._number = newNumber
        self.changeColor(self.getCurrentColor())
    }
    }
    
    init(size: CGFloat, number: Int) {
        super.init(color: self.getCurrentColor(), width: size, height: size, fromCenter: true)
        
        self._size = size
        self.number = number
        //self.anchorPoint = CGPointMake(x: size / 2, y: size / 2)
    }
    
    func getCurrentColor() -> SKColor {
        return SKColor(red: 242/255, green: 177/255, blue: 121/255, alpha: 1)
    }
    
    
    func getLabel() -> SKLabelNode {
        let myLabel = SKLabelNode(fontNamed:"HelveticaNeue-CondensedBlack")
        myLabel.text = String(number);
        myLabel.fontSize = 45;
        myLabel.position = CGPoint(x:self.position.x, y:self.position.y - 20);
        
        return myLabel
    }
    
}