//
//  MinesweeperApp.swift
//  Minesweeper
//
//  Created by Ronak Harkhani on 09/03/21.
//

import SwiftUI

@main
struct MinesweeperApp: App {
    var gameSettings = GameSettings()
    
    var body: some Scene {
        WindowGroup {
            BoardView()
                .environmentObject(Game(from: gameSettings))
        }
    }
}
