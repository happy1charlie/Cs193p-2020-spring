//
//  CardContent + Equatable.swift
//  Set Game
//
//  Created by Charlie on 2021/1/26.
//

import Foundation

protocol CardContent: Equatable {
    associatedtype Content
}

extension CardContent {
    static func isCorrectSet<Content: Equatable> (contentA: Content, contentB: Content, contentC: Content) -> Bool {
        return (contentA == contentB && contentB == contentC) ||
               (contentA != contentB && contentB != contentC && contentA != contentC)
    }
}
