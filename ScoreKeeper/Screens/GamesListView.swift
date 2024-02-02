//
//  GamesListView.swift
//  ScoreKeeper
//
//  Created by Ivanov, D. (Dmitrii) on 25/01/2024.
//

import SwiftUI

struct GamesListView: View {
    
    @ObservedObject var viewModel: GamesModel
    @State private var isAddingFormPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List(viewModel.games()) { gameType in
                        NavigationLink(gameType) { Text(gameType) }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        GreenPlusButton { isAddingFormPresented = true }
                        Spacer().frame(width: 32)
                    }
                }
            }
            .navigationTitle("Games")
        }
        .sheet(isPresented: $isAddingFormPresented) {
            AddGameForm(viewModel: viewModel, isPresented: $isAddingFormPresented)
        }
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView(viewModel: GamesModel())
    }
}

final class GamesModel: ObservableObject {
    @Published var dict = [String: [GamesWithPartner]]()
    
    func games() -> [String] {
        var games = [String]()
        for (key, value) in dict {
            if value.isEmpty {
                games.append(key)
            } else {
                for gameAndPartner in value {
                    games.append("\(key) (\(gameAndPartner.partner.name))")
                }
            }
        }
        return games
    }
    
    func addNewGameType(_ newType: String, partner: String) {
        if partner.isEmpty {
            dict[newType.capitalized] = [GamesWithPartner]()
        } else {
            let newGamePartner = GamesWithPartner(partner: Partner(name: partner))
            dict[newType.capitalized] = [newGamePartner]
        }
    }
}

final class GamesWithPartner {
    let partner: Partner
    var games: [Game] = [Game]()
    var cumulativeScore: Int = 0 // positive: I won, negative: I lost
    
    init(partner: Partner) {
        self.partner = partner
    }
}

struct Game {
    let type: String
    let partner: Partner
    let score: Int // positive: I won, negative: I lost
}

struct Partner {
    let name: String
}
