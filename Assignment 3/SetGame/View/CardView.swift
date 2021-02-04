//
//  SwiftUIView.swift
//  Set Game
//
//  Created by Charlie on 2021/2/1.
//

import SwiftUI

struct CardView: View {
    var card: SetGameCard
    var untidy = false

    @State private var standardOffSet: CGSize = CGSize(width: 0, height: 0)
    @State private var deckOffSet: CGSize = CGSize(width: 2.0, height: 2.0)
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                Rectangle()
                    .fill(Color.white)
                    .shadow(color: Color.gray, radius: 3, x: 1, y: 1)
                    .overlay(
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 3.0)
                            .foregroundColor(.black)
                            .opacity(card.isSelected ? 1 : 0)
                    )
                    .aspectRatio(4/7, contentMode: .fit)
                
                CardContentBuilder(card: card)
                    .padding(5)
                    .opacity(card.isFaceUp ? 1 : 0.1)
            } else {
                CardBackView()
            }
        }
        .offset(untidy ? deckOffSet : standardOffSet)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGameCard(color: .red, background: .empty, number: .two, shape: .circle,  isFaceUp: true)
        
        VStack {
            CardView(card: card)
                .frame(width: 200, height: 200)
        }
    }
}
