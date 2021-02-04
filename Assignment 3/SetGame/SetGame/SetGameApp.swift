//
//  SetGameApp.swift
//  SetGame
//
//  Created by Charlie on 2021/2/2.
//

import SwiftUI

@main
struct SetGameApp: App {
    @StateObject var viewModel = SetCardGame(cards: SetGameCard.generateCard())
    
    var body: some Scene {
        WindowGroup {
            ContentView(game: viewModel)
        }
    }
}
