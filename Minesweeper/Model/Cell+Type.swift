//
//  Cell+Type.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import Foundation

extension Cell {
    // TODO: Keep only normal(Int) and bomb cases
    enum CellType: Equatable {
        case normal // Cell not touching any bomb
        case exposed(Int) // Cell touches n bombs
        case bomb // Cell is a bomb
    }
}
