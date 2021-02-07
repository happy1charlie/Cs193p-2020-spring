//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Charlie on 2020/12/17.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
