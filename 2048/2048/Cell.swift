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
    var label : SKLabelNode?
    
    let GRID_MARGIN:Float = 10 // bad
    
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
        
        self.label = SKLabelNode(fontNamed:"HelveticaNeue-CondensedBlack")
        self.label!.text = String(number)
        self.label!.fontSize = self._size / 1.76

        self.label!.position = CGPoint(x:0, y: -15)

        self.addChild(self.label!)

        let action = SKAction.sequence([SKAction.scaleBy(0.8, duration: 0), SKAction.scaleBy(1.25, duration: 0.15)])
        
        self.runAction(action)
    }
    
    func getCurrentColor() -> SKColor {
        var color: SKColor = SKColor(red: 238/255, green: 228/255, blue: 218/255, alpha: 1)
        switch self._number {
            case 2: color = SKColor(red: 238/255, green: 228/255, blue: 218/255, alpha: 1)
            case 4: color = SKColor(red: 237/255, green: 224/255, blue: 200/255, alpha: 1)
            case 8: color = SKColor(red: 242/255, green: 177/255, blue: 121/255, alpha: 1)
            case 16: color = SKColor(red: 245/255, green: 149/255, blue: 99/255, alpha: 1)
            case 32: color = SKColor(red: 246/255, green: 124/255, blue: 59/255, alpha: 1)
            case 64: color = SKColor(red: 246/255, green: 94/255, blue: 59/255, alpha: 1)
            default: color = SKColor(red: 246/255, green: 124/255, blue: 95/255, alpha: 1)
        }
        return color
    }
    
    
    func setCellPosition(i: Int, j: Int) {
        let xPos:CGFloat = CGFloat(CGFloat(j) * self._size +
            CGFloat(j + 1) * (CGFloat(GRID_MARGIN))) + 10 + self._size / 2
        
        let yPos:CGFloat = CGFloat(CGFloat(3-i) * (self._size + CGFloat(GRID_MARGIN))) + 60 + CGFloat(GRID_MARGIN) + self._size / 2
        
        self.position = CGPoint(x: xPos, y: yPos)
    }
    
    func moveToPosition(row: Int, col: Int) {
        let xPos:CGFloat = CGFloat(CGFloat(col) * self._size +
            CGFloat(col + 1) * (CGFloat(GRID_MARGIN))) + 10 + self._size / 2
        
        let yPos:CGFloat = CGFloat(CGFloat(3-row) * (self._size + CGFloat(GRID_MARGIN))) + 60 + CGFloat(GRID_MARGIN) + self._size / 2

        let action = SKAction.sequence([SKAction.moveTo(CGPoint(x: xPos, y:yPos), duration: 0.15)])

        self.runAction(action)
    }
    
}