//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/6.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var Game: MemoryGame<String>
    
    init () {
        let theme = Theme.element.randomElement()!
        Game = EmojiMemoryGame.createMemoryGame(with: theme)
        color = theme.color
        name = theme.name
    }
    
    // MARK: use function to initialize var Game
    // static func bind createMemoryGame with EmojiMemoryGame type
    static func createMemoryGame (with theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emoji
        let randomPairs = theme.numberOfCards ?? Int.random(in: 3...6)
        return MemoryGame<String>(numberOfPairsOfCards: randomPairs) {
            pairIndex in emojis[pairIndex] }
    }
    
    // MARK: modify model with users' intent
    func choose (card: MemoryGame<String>.Card) {
        Game.choose(card: card)
    }
    
    func reset () {
        let theme = Theme.element.randomElement()!
        Game = EmojiMemoryGame.createMemoryGame(with: theme)
        color = theme.color
        name = theme.name
    }
    
    // MARK: acsess to the model in safe way(use var to only acsess the .cards array but not other things)
    var cards: Array<MemoryGame<String>.Card> {
        Game.cards
    }
    
    var score: Int {
        Game.score
    }
    
    var color: Color
    var name: String
    
}
