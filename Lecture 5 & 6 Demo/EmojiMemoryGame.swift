//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Charlie on 2020/12/20.
//

import Foundation

// why viewmodel should be a class? -> it's a pointer. all view can look through this portal.
class EmojiMemoryGame: ObservableObject {
    // accesing model
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static let random = Int.random(in: 2...5)

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["😊","😁","🤪","🥳","😎","😕","🥺","🤣"]
        return MemoryGame<String>(numberOfPairsOfCards: random) { pairIndex in emojis[pairIndex] }
    }
    
    // accsess to model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame () {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
