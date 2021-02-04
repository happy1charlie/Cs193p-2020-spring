//
//  SetGameCard.swift
//  Set Game
//
//  Created by Charlie on 2021/1/29.
//

import Foundation

struct SetGameCard: CardModel {
    typealias ElementA = Color
    typealias ElmenetB = Background
    typealias ElementC = Number
    typealias ElementD = Shape
    
    var featureA: Color { return color }
    var featureB: Background { return background }
    var featureC: Number { return number }
    var featureD: Shape { return shape }
    
    var color: Color
    var background: Background
    var number: Number
    var shape: Shape
    
    var id = UUID()
    var isMatched = false
    var isFaceUp = false
    var isSelected = false
    
    static func generateCard() -> [SetGameCard] {
        var cards = [Self]()
        for color in Color.allCases {
            for background in Background.allCases {
                for number in Number.allCases {
                    for shape in Shape.allCases {
                        cards.append(Self.init(color: color, background: background, number: number, shape: shape))
                    }
                }
            }
        }
        print("init \(cards.count) cards.")
        return cards
    }
    
    enum Color: CardContent, CaseIterable {
        typealias Content = Color
        case blue, yellow, red
    }
    
    enum Background: CardContent, CaseIterable {
        typealias Content = Background
        case empty, solid, stripped
    }
    
    enum Number: Int, CardContent, CaseIterable {
        typealias Content = Number
        case one = 1, two, three
    }
    
    enum Shape: CardContent, CaseIterable {
        typealias Content = Shape
        case circle, star, diamond
    }
}

