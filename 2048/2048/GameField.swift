//
//  gameField.swift
//  2048
//
//  Created by Дмитрий on 07.06.14.
//  Copyright (c) 2014 rdmv. All rights reserved.
//

import Foundation


struct GameField {
    let rows: Int, columns: Int
    var grid: Cell?[]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: nil)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Cell? {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
