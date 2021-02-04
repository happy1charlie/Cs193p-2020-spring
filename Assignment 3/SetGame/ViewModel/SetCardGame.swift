//
//  SetGameViewModel.swift
//  Set Game
//
//  Created by Charlie on 2021/1/20.
//

import Foundation

class SetCardGame: ObservableObject {
    @Published private var game: SetGame<SetGameCard>
    
    init (cards: [SetGameCard]) {
        game = SetGame(cards: cards)
    }
    
    var cards: [SetGameCard] {
        game.cards
    }
    
    var cardsInGame: [SetGameCard] {
        game.cardsInGame
    }
    
    var discardedCard: [SetGameCard] {
        game.discardedCard
    }
    
    var score: Int {
        game.score
    }
    
    func distributeCard() {
        game.distributeCard()
    }
    
    func initialGame() {
        game.distributeCard(12)
    }
    
    func select(card: SetGameCard) {
        game.select(card: card)
    }
    
    func restart() {
        let cards = SetGameCard.generateCard()
        game = SetGame(cards: cards)
        initialGame()
    }

}
