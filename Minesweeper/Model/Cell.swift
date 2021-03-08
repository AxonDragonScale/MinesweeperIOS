//
//  Cell.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import Foundation
import SwiftUI

class Cell {
    // TODO: Change to Position
    var row: Int
    var col: Int
    
    @Published var type: CellType
    
    // TODO: Use Enum for cell state
    @Published var isOpened: Bool
    @Published var isFlagged: Bool
    
    var image: Image {
        if !isOpened && isFlagged {
            return Image("flag")
        }
        
        switch type {
        case .normal:
            return Image("normal")
        case .exposed(let surroundingBombs):
            if !isOpened {
                return Image("normal")
            }
            
            if surroundingBombs == 0 {
                return Image("empty")
            }
            return Image("\(surroundingBombs)")
        case .bomb:
            return Image("bomb")
        }
    }
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
        self.type = .normal
        self.isOpened = false
        self.isFlagged = false
    }
}
