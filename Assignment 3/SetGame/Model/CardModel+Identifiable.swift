//
//  Card + Identifiable.swift
//  Set Game
//
//  Created by Charlie on 2021/1/25.
//

import Foundation

protocol CardModel: Identifiable, Equatable where ElementA: CardContent, ElementB: CardContent, ElementC: CardContent, ElementD: CardContent {
    associatedtype ElementA
    associatedtype ElementB
    associatedtype ElementC
    associatedtype ElementD
    
    var featureA: ElementA { get }
    var featureB: ElementB { get }
    var featureC: ElementC { get }
    var featureD: ElementD { get }
        
    var isFaceUp: Bool { get set }
    var isMatched: Bool { get set }
    var isSelected: Bool { get set }
    
    static func generateCard() -> [Self]
}

extension CardModel {
    var faceUp: Self {
        var card = self
        card.isFaceUp = true
        return self
    }
    
    var faceDown: Self {
        var card = self
        card.isFaceUp = false
        return self
    }
    
    var unSelected: Self {
        var card = self
        card.isSelected = false
        return self
    }
}


// MARK - isSet

extension CardModel {
    static func isSet(card1: Self, card2: Self, card3: Self) -> Bool {
        let setList = [
            ElementA.isCorrectSet(contentA: card1.featureA, contentB: card2.featureA, contentC: card3.featureA),
            ElementB.isCorrectSet(contentA: card1.featureB, contentB: card2.featureB, contentC: card3.featureB),
            ElementC.isCorrectSet(contentA: card1.featureC, contentB: card2.featureC, contentC: card3.featureC),
            ElementD.isCorrectSet(contentA: card1.featureD, contentB: card2.featureD, contentC: card3.featureD)
        ]

        return true //setList.reduce(true) {$0 && $1}
    }
}
