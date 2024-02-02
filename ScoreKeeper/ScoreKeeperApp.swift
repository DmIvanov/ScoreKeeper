//
//  ScoreKeeperApp.swift
//  ScoreKeeper
//
//  Created by Ivanov, D. (Dmitrii) on 25/01/2024.
//

import SwiftUI

@main
struct ScoreKeeperApp: App {
    
    var body: some Scene {
        WindowGroup {
            GamesListView(viewModel: GamesModel())
        }
    }
}
