//
//  SetGame.swift
//  Set Game
//
//  Created by Charlie on 2021/1/20.
//

import Foundation

struct SetGame<Card> where Card: CardModel {
    private(set) var cards: [Card]
    private(set) var cardsInGame: [Card]
    private(set) var discardedCard: [Card]
    private(set) var score: Int = 0
    private var isSelcetedCard: [Card] {
        cardsInGame.filter { $0.isSelected }
    }

    
    init (cards: [Card]) {
        self.cards = cards.map(\.faceDown.unSelected).shuffled()
        cardsInGame = []
        discardedCard = []
    }
    
    mutating func distributeCard (_ quantity:Int  = 3) {
        guard cardsInGame.count < 15 else { return }
        
        var newCard = cards.prefix(quantity)
        
        for index in newCard.indices {
            newCard[index].isFaceUp = true
        }
        
        cardsInGame.append(contentsOf: newCard)
        cards.removeFirst(quantity)
        print("cardsIndeck:\(cards.count), cardsInGame:\(cardsInGame.count), discardedCard:\(discardedCard.count)")
    }
    
    mutating func select (card: Card) {
        guard isSelcetedCard.count < 3 else { return }
        
        for index in cardsInGame.indices {
            if cardsInGame[index] == card {
                cardsInGame[index].isSelected.toggle()
            }
        }
        checkSet()
    }
    
    private mutating func checkSet () {
        guard isSelcetedCard.count == 3 else { return }
        
        if Card.isSet(card1: isSelcetedCard[0], card2: isSelcetedCard[1], card3: isSelcetedCard[2]) {
            print("correct")
            disCard()
        } else {
            print("incorrect")
            unSelcetAll()
        }
    }
    
    private mutating func disCard () {
        for _ in isSelcetedCard.indices {
            if let index = cardsInGame.firstIndex(of: isSelcetedCard.first!) {
                cardsInGame[index].isMatched = true
                let removedCard = cardsInGame.remove(at: index)
                discardedCard.append(removedCard.unSelected)
            }
        }
    }

    private mutating func unSelcetAll () {
        for index in cardsInGame.indices {
            if isSelcetedCard.contains(cardsInGame[index]) {
                cardsInGame[index].isSelected = false
            }
        }
    }
    
    private mutating func earnPoint() {
        score += 5
    }
    
    private mutating func penalizePoint() {
        var tmp = score
        tmp -= 5
        if tmp < 0 {
            return score = 0
        } else {
            return score = tmp
        }
    }
}
