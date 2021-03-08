//
//  Game.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import Foundation

class Game: ObservableObject {
    @Published var settings: GameSettings
    
    init(from settings: GameSettings) {
        self.settings = settings
    }
}
