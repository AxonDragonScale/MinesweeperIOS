//
//  CellView.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import SwiftUI

struct CellView: View {
    @EnvironmentObject var game: Game
    let cell: Cell
    
    var body: some View {
        cell.image
            .resizable()
            .scaledToFill()
            .frame(width: game.settings.squareSize, height: game.settings.squareSize, alignment: .center)
            .onTapGesture {
                game.open(cell: cell)
            }
            .onLongPressGesture {
                game.toggleFlagFor(cell: cell)
            }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(row: 0, col: 0))
            .environmentObject(Game(from: GameSettings()))
    }
}
