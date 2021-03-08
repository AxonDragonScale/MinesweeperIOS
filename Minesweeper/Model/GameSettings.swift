//
//  GameSettings.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import Foundation
import SwiftUI

class GameSettings: ObservableObject {
    @Published var numRows = 10
    @Published var numCols = 10
    @Published var numBombs = 10
    
    var squareSize: CGFloat {
        UIScreen.main.bounds.width / CGFloat(numCols)
    }
}
