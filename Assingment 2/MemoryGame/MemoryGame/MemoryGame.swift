//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/6.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var score: Int = 0
    
    var indexOfTheOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
            
        set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }

    mutating func choose(card: Card) {
        print("Chosen card:\(card)")
        if let chosenIndex = cards.matchedIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchedCard = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchedCard].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedCard].isMatched = true
                    score += 2
                } else {
                    self.check(score: score)
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func check (score: Int) {
        if self.score == 0 {
            return self.score = 0
        } else {
            return self.score -= 1
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
