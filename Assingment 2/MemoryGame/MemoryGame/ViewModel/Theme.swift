//
//  Theme.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/6.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var color: Color
    var emoji: [String]
    var numberOfCards: Int?
    
    static let element = [face, animal, sport, car, tech, gesture]

    static let face: Theme = Theme (name: "Face", color: .gray, emoji: ["😀","😃","😄","😁","😆","😅"])
    static let animal = Theme(name: "Animal", color: .orange, emoji: ["🐶","🐱","🐭","🐹","🐰","🐙"])
    static let sport = Theme(name: "Sport", color: .red, emoji: ["⚽","🏀","🏈","⚾","🥎","🎱"])
    static let car = Theme(name: "Car", color: .blue, emoji: ["🚗","🚙","🚕","🛺","🚌","🚖"], numberOfCards: 6)
    static let tech = Theme(name: "Tech", color: .yellow, emoji: ["⌚","📱","📲","💻","⌨"], numberOfCards: 5)
    static let gesture = Theme(name: "Gesture", color: .green, emoji:  ["👇","🖖","✋","🤚","🖐","🤏"], numberOfCards: 6)
}
