//
//  GameScene.swift
//  2048
//
//  Created by Дмитрий on 05.06.14.
//  Copyright (c) 2014 rdmv. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var counter: Float = 0
    var singleCellSize: CGFloat = 0
    let GRID_MARGIN: Float = 10
    var swipeRightGesture: UISwipeGestureRecognizer?
    
    override func didMoveToView(view: SKView) {
        self.drawBackground()
        
        let gridCell = Cell(size: self.singleCellSize, number: 2)
        gridCell.setCellPosition(Int(0), j:Int(0))
        
        self.addChild(gridCell)

        gridCell.moveToPosition(0, col: 3)
        
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
        let cellSize:CGFloat = CGFloat((gridSize - 5 * GRID_MARGIN) / 4)
        self.singleCellSize = cellSize
        

        for i in 0..4 {
            for j in 0..4 {
                let gridCell = GameRect(color:SKColor(red: 238/255, green: 228/255, blue: 218/255, alpha: 0.35), width:cellSize, height:cellSize)
                let xPos:CGFloat = CGFloat(CGFloat(i) * cellSize + CGFloat(i + 1) * CGFloat(GRID_MARGIN)) + 10
                let yPos:CGFloat = CGFloat(CGFloat(j) * (cellSize + CGFloat(GRID_MARGIN))) + 60 + CGFloat(GRID_MARGIN)
                gridCell.position = CGPoint(x: xPos, y: yPos)
                
                self.addChild(gridCell)
            }
        }
    }
        
    
    func moveRight() {
        NSLog("swiped")
    }
    
    func moveLeft() {
        NSLog("swiped")
    }
    
    func moveUp() {
        NSLog("swiped")
    }
    
    func moveDown() {
        NSLog("swiped")
    }
}
