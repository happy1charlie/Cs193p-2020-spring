//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/5.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(gamePortal: game)
        }
    }
}
