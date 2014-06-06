//
//  GameScene.swift
//  2048
//
//  Created by Дмитрий on 05.06.14.
//  Copyright (c) 2014 rdmv. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var counter:Float = 0
    var singleCellSize: CGFloat = 0
    let GRID_MARGIN:Float = 10
    
    override func didMoveToView(view: SKView) {
        self.drawBackground()
        
        /*var path : CGMutablePath = CGPathCreateMutable()
        
        let size = self.size
        
        var node = SKShapeNode()
        node.path = CGPathCreateWithRoundedRect(CGRectMake(10, 10, 300, 300), 4, 4, nil)
        
        node.fillColor = SKColor(red: 187/255, green: 173/255, blue: 160/255, alpha: 1)
        node.strokeColor = SKColor(red: 187/255, green: 173/255, blue: 160/255, alpha: 1)
        
        
        node.position = CGPoint(x:0, y: 40)
        
        println(node.position)
        self.addChild(node)*/
        
    }
    
    func drawBackground() {
        self.backgroundColor = SKColor(red:250/255, green:248/255, blue:239/255, alpha:1)
        
        let gridSize = self.size.width - 20
        let gridMargin = 60
        let grid = GameRect(color:SKColor(red: 187/255, green: 173/255, blue: 160/255, alpha: 1), width:gridSize, height:gridSize)
        
        grid.position = CGPoint(x: 10, y: gridMargin)
        
        self.addChild(grid)
        
        self.drawGrid(Float(gridSize))
        
    }
    
    func drawGrid(gridSize: Float) {
        let cellSize:CGFloat = CGFloat((gridSize - 4 * GRID_MARGIN) / 3)
        self.singleCellSize = cellSize
        
        println(cellSize)
        println(gridSize)

        for i in 0..3 {
            for j in 0..3 {
                let gridCell = GameRect(color:SKColor(red: 238/255, green: 228/255, blue: 218/255, alpha: 0.35), width:cellSize, height:cellSize)
                let xPos:CGFloat = CGFloat(CGFloat(i) * cellSize + CGFloat(i + 1) * CGFloat(GRID_MARGIN)) + 10
                let yPos:CGFloat = CGFloat(CGFloat(j) * (cellSize + CGFloat(GRID_MARGIN))) + 60 + CGFloat(GRID_MARGIN)
                gridCell.position = CGPoint(x: xPos, y: yPos)
                
                self.addChild(gridCell)
            }
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
       
        let i = arc4random() % 3
        let j = arc4random() % 3
        
        let gridCell = Cell(size: self.singleCellSize, number: 2)
        let xPos:CGFloat = CGFloat(CGFloat(i) * self.singleCellSize + CGFloat(i + 1) * CGFloat(GRID_MARGIN)) + 10
        let yPos:CGFloat = CGFloat(CGFloat(j) * (self.singleCellSize + CGFloat(GRID_MARGIN))) + 60 + CGFloat(GRID_MARGIN)
        gridCell.position = CGPoint(x: xPos, y: yPos)
        
        self.addChild(gridCell)

        
        
        /*var path : CGMutablePath = CGPathCreateMutable()
        
        
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.xScale = 0.5
        sprite.yScale = 0.5

        
        var node = SKShapeNode()
        counter++
        var pos:Float = 10 * counter
        
        sprite.position = CGPoint(x:pos, y:pos)
        self.addChild(sprite)
        let size = self.size
        
        node.path = CGPathCreateWithRoundedRect(CGRectMake(pos, pos, 40, 40), 4, 4, nil)
        node.fillColor = SKColor.darkGrayColor()
        
        node.position = self.anchorPoint
        self.addChild(node)
        println(pos)*/
        
        /* Called when a touch begins */
        
       /* for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
            println(location)
        }*/
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
