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
            ZStack{
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRaidus).stroke(color, lineWidth: lineWidth)
                    RoundedRectangle(cornerRadius: cornerRaidus).fill(Color.white)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRaidus)
                            .fill(LinearGradient(gradient: Gradient(colors: [color, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    }
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
            //let _ = print("width:\(geometry.size.width), height\(geometry.size.height)")
        }
    }
    
    // MARK: control panel
    let cornerRaidus: CGFloat = 10.0
    let lineWidth: CGFloat = 5
    
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
