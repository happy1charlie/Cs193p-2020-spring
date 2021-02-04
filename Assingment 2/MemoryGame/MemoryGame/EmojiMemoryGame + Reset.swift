//
//  EmojiMemoryGame + Reset.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/14.
//

import Foundation

extension EmojiMemoryGame {
    func reset () {
        theme = Theme.element.randomElement()!
        Game = EmojiMemoryGame.createMemoryGame(with: theme)
        color = theme.color
        name = theme.name
    }
}
