//
//  BoardView.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(game.board.indices, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(game.board[row].indices, id: \.self) { col in
                        CellView(cell: game.board[row][col])
                    }
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    private static var gameSettings = GameSettings()
    static var previews: some View {
        BoardView()
            .environmentObject(Game(from: gameSettings))
    }
}
