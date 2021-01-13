//
//  Array + IndexFinder.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/11.
//

import Foundation

extension Array where Element: Identifiable {
    func matchedIndex (matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
