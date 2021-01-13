//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Charlie on 2020/12/20.
//

import Foundation

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static let random = Int.random(in: 2...5)

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["😊","😁","🤪","🥳","😎","😕","🥺","🤣"]
        return MemoryGame<String>(numberOfPairsOfCards: self.random, cardContentFactory: {(pairIndex: Int) -> String in return emojis[pairIndex]})
    }
    
    // accsess to model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
