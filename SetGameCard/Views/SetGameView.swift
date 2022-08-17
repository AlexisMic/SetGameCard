//
//  ContentView.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/15/22.
//

import SwiftUI

struct SetGameView: View {
    
    @ObservedObject var gameVM: GameViewModel
    
    var body: some View {
        VStack {
            Text("Set Game")
                .font(.largeTitle)
                .padding()
            Spacer()
            ScrollView {
                LazyVGrid(columns: [adaptativeGrid(widht: DrawingConstants.cardWidth)]) {
                    ForEach (gameVM.cards) { card in
                        if card.isDistributed {
                            CardView(card: card)
                                .padding(3)
                                .onTapGesture {
                                    gameVM.chooseCard(card: card)
                                }
                        }
                    }
                }
            }
            buttons
        }
    }
    
    private func adaptativeGrid(widht: CGFloat) -> GridItem {
        var gride = GridItem(.adaptive(minimum: widht), spacing: 0)
        gride.spacing = 0
        return gride
    }
    
    private var buttons: some View {
        HStack {
            Button {
                gameVM.newGame()
            } label: {
                Text("New Game")
            }
            Spacer()
            Button {
                gameVM.dealCards()
            } label: {
                Text("New Cards")
            }
        }
        .padding(.horizontal, 50)
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let gameVMPreview = GameViewModel()
        gameVMPreview.dealCards()
//        gameVMPreview.cards
        return Group {
            SetGameView(gameVM: gameVMPreview)
                .previewInterfaceOrientation(.portrait)
            
            SetGameView(gameVM: gameVMPreview)
                .preferredColorScheme(.dark)
        }
    }
}
