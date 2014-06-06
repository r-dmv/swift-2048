
//
//  GameRect.swift
//  2048
//
//  Created by Дмитрий on 05.06.14.
//  Copyright (c) 2014 rdmv. All rights reserved.
//

import Foundation
import SpriteKit

class GameRect : SKShapeNode {
    init(color:SKColor, width: CGFloat, height: CGFloat) {
        super.init()
        self.path = CGPathCreateWithRoundedRect(CGRectMake(0, 0, width, height), 4, 4, nil)
        
        self.changeColor(color)
        
        self.position = CGPoint(x:0, y: 0)
    }
    
    func changeColor(color: SKColor) {
        self.fillColor = color
        self.strokeColor = color
    }
}
