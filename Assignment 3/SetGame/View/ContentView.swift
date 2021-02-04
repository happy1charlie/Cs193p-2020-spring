//
//  ContentView.swift
//  Set Game
//
//  Created by Charlie on 2021/1/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: SetCardGame
    let columns = [GridItem(.adaptive(minimum: 50)),
                   GridItem(.adaptive(minimum: 50)),
                   GridItem(.adaptive(minimum: 50)),
                   GridItem(.adaptive(minimum: 50))]
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: Background
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                // MARK: Cards
                VStack {
                    GeometryReader { geometry in
                        ScrollView() {
                            LazyVGrid(columns: columns) {
                                ForEach(game.cardsInGame) { card in
                                    CardView(card: card)
                                        .animation(.easeInOut(duration: 0.6))
                                        .onTapGesture {
                                            withAnimation(.easeInOut(duration: 1)) {
                                                self.game.select(card: card)
                                            }
                                        }
                                        .scaleEffect(card.isSelected ? 1.05 : 1)
                                        .transition(.offsetWithOpacity(width: 0, height: geometry.size.height))
                                        .padding(5)
                                }
                            }
                        }
                        .onAppear {
                            withAnimation {
                                game.initialGame()
                            }
                        }
                    }
                
                    Spacer()
                    
                    // MARK: Cards and discardedCard
                    HStack {
                        ZStack {
                            ForEach(game.cards) { card in
                                CardView (card: card, untidy: true)
                                    .frame(width: 100, height: 100)
                                    .onTapGesture { game.distributeCard() }
                            }
                        }
                        Spacer()
                        ZStack {
                            ForEach(game.discardedCard) { card in
                                CardView(card: card, untidy: true)
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                }
                .padding(15)
            }
        
            // MARK: Action
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 20) {
                        Button(action: { withAnimation(.easeOut(duration: 0.3)) { game.restart() }},
                               label: { Text("New Game") })
                    
                    Divider()
                        Text("score:\(game.score)")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .fixedSize(horizontal: true, vertical: false)
                    Divider()
                        Button(action: { withAnimation(.easeIn(duration: 0.3)) { game.distributeCard() } },
                           label: { Text("Add Cards") })
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: SetCardGame(cards: SetGameCard.generateCard()))
    }
}
