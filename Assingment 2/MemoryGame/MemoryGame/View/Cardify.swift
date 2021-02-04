//
//  Cardify.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/18.
//

import Foundation
import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRaidus).stroke(color, lineWidth: lineWidth)
                RoundedRectangle(cornerRadius: cornerRaidus).fill(Color.white)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRaidus)
                .fill(LinearGradient(gradient: Gradient(colors: [color, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            }
        }
    }
    
    private let cornerRaidus: CGFloat = 10.0
    private let lineWidth: CGFloat = 5
}
