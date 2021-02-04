//
//  CardContentBuilder.swift
//  Set Game
//
//  Created by Charlie on 2021/2/1.


import SwiftUI

struct CardContentBuilder: View {
    var card: SetGameCard
    
    struct CardShapeBuilder: Shape {
        var shape: SetGameCard.Shape
        
        func path(in rect: CGRect) -> Path {
            switch shape {
            case .circle: return Circle().path(in: rect)
            case .diamond: return DiamondShape().path(in: rect)
            case .star: return StarShape(corners: 5, smoothness: 0.65).path(in: rect)
            }
        }
    }
    
    private var color: Color {
        switch card.color {
        case .yellow: return .yellow
        case .blue: return .blue
        case .red: return .red
        }
    }
        
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                ForEach(0..<card.number.rawValue, id: \.self) { _ in
                    CardShapeBuilder(shape: card.shape)
                        .contentBackground(card.background)
                        .overlay(CardShapeBuilder(shape: card.shape)
                                    .stroke(lineWidth: 3))
                        .foregroundColor(color)
                        .aspectRatio(1, contentMode: .fit)
                        
                }
            }
            .padding(10)
        }
        .padding(.horizontal, 10)
    }
}

struct CardContentBuilder_Previews: PreviewProvider {
    static var previews: some View {
        CardContentBuilder(card: SetGameCard(color: .blue, background: .stripped, number: .three, shape: .star))
            .frame(width: 200, height: 200)
    }
}
