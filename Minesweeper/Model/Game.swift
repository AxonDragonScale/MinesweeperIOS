//
//  Game.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import Foundation

class Game: ObservableObject {
    @Published var settings: GameSettings
    @Published var board: [[Cell]]
    
    init(from settings: GameSettings) {
        self.settings = settings
        self.board = Self.generateBoard(from: settings)
    }
    
    private static func generateBoard(from settings: GameSettings) -> [[Cell]] {
        var newBoard = [[Cell]]()
        
        for row in 0..<settings.numRows {
            var curRow = [Cell]()
            for col in 0..<settings.numCols {
                curRow.append(Cell(row: row, col: col))
            }
            newBoard.append(curRow)
        }
        
        var bombCount = 0
        while bombCount < settings.numBombs {
            let randRow = Int.random(in: 0..<settings.numRows)
            let randCol = Int.random(in: 0..<settings.numCols)
            
            // If the random cell is not already a bomb, make it a bomb
            if newBoard[randRow][randCol].type != .bomb {
                newBoard[randRow][randCol].type = .bomb
                bombCount += 1
            }
        }
        
        return newBoard
    }
}
