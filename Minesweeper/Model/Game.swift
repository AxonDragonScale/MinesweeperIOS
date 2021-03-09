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
    @Published var gameOver: Bool = false
    
    init(from settings: GameSettings) {
        self.settings = settings
        self.board = Self.generateBoard(from: settings)
    }
    
    func reset() {
        board = Self.generateBoard(from: settings)
        gameOver = false
    }
    
    func toggleFlagFor(cell: Cell) {
        guard !cell.isOpened else {
            return
        }
        
        cell.isFlagged = !cell.isFlagged
        self.objectWillChange.send()
    }
    
    func open(cell: Cell) {
        if cell.type == .bomb {
            cell.isOpened = true
            gameOver = true
        } else {
            reveal(cell: cell)
        }
        
        self.objectWillChange.send()
    }
    
    private func reveal(cell: Cell) {
        guard !cell.isOpened else {
            return
        }
        
        guard !cell.isFlagged else {
            return
        }
        
        guard cell.type != .bomb else {
            return
        }
        
        let surroundingBombCount = getSurroundingBombCount(for: cell)
        cell.type = .normal(surroundingBombCount)
        cell.isOpened = true
        
        if (surroundingBombCount == 0) {
            let topCell = board[max(0, cell.row - 1)][cell.col]
            let bottomCell = board[min(settings.numRows - 1, cell.row + 1)][cell.col]
            let leftCell = board[cell.row][max(0, cell.col - 1)]
            let rightCell = board[cell.row][min(settings.numCols - 1, cell.col + 1)]
            
            reveal(cell: topCell)
            reveal(cell: bottomCell)
            reveal(cell: leftCell)
            reveal(cell: rightCell)
        }
    }
    
    private func getSurroundingBombCount(for cell: Cell) -> Int {
        let minRow = max(0, cell.row - 1)
        let minCol = max(0, cell.col - 1)
        let maxRow = min(cell.row + 1, settings.numRows - 1)
        let maxCol = min(cell.col + 1, settings.numCols - 1)
        
        var bombCount = 0
        for row in minRow...maxRow {
            for col in minCol...maxCol {
                if board[row][col].type == .bomb {
                    bombCount += 1
                }
            }
        }
        
        return bombCount
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
