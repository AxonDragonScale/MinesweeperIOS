//
//  GameSettings.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import Foundation
import SwiftUI

class GameSettings: ObservableObject {
    @Published var numCols = 10
    
    var squareSize: CGFloat {
        UIScreen.main.bounds.width / CGFloat(numCols)
    }
    
    var numRows: Int {
        Int(UIScreen.main.bounds.height / squareSize) - 1
    }
    
    var numBombs: Int {
        numCols * numRows / 10
    }
}
