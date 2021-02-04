//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/5.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gamePortal: EmojiMemoryGame
    
    var color: Color {
        return gamePortal.color
    }

    var body: some View {
        VStack{
            HStack {
                Text(gamePortal.name)
                    .font(.largeTitle)
                    .layoutPriority(1)
                Spacer()
                Text("Score: \(gamePortal.score)")
            }.padding(.horizontal, 20)
             .padding(.vertical, 10)
            
            Grid(items: gamePortal.cards) { card in
                CardView(card: card, color: color).onTapGesture {
                    gamePortal.choose(card: card)
                }.padding()
                 .foregroundColor(color)
            }
            
            Button(action: {
                gamePortal.reset()
            }) {
                Text("New Game")
                    .font(.title)
                    .padding(.vertical, 10)
            }.foregroundColor(color)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @ViewBuilder func body (for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startedAngle: Angle.degrees(-90), endedAngle: Angle.degrees(30), clockwise: true).padding(5).opacity(0.7)
                Text(card.content)
            }
            .font(Font.system(size: fontSize(for: size)))
            .modifier(Cardify(isFaceUp: card.isFaceUp, color: color))
//            .Cardify(isFaceUp: card.isFaceUp, color: color)
        }
    }
    
    // MARK: control panel
    
    func fontSize (for size:CGSize) -> (CGFloat) {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            EmojiMemoryGameView(gamePortal: game)
        }
    }
}
