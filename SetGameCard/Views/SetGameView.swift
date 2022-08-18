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
            GeometryReader { geometry in
                ScrollView {
                    
                    VStack {
                        LazyVGrid(columns: [adaptativeGrid(widht: adaptiveWidth(size: geometry.size, aspectRatio: Constants.aspectRatioCard))]) {
                            ForEach (gameVM.cards) { card in
                                if card.isDistributed {
                                    CardView(card: card)
                                        .aspectRatio(Constants.aspectRatioCard, contentMode: .fit)
                                        .padding(3)
                                        .onTapGesture {
                                            gameVM.chooseCard(card: card)
                                        }
                                }
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    
                }
            }
            buttons
        }
    }
    
    private func adaptiveWidth(size: CGSize, aspectRatio: CGFloat) -> CGFloat {
        var columns = 0
        var rows = Double(gameVM.numberOfDistributedCards)
        var allCardsHeight: CGFloat = 10000
        var width: CGFloat = 60.0
        while allCardsHeight > size.height {
            columns += 1
            rows = Double(gameVM.numberOfDistributedCards) / Double(columns)
            rows.round(.up)
            width = size.width / CGFloat(columns)
            let cardHeight: CGFloat = width / aspectRatio
            allCardsHeight = CGFloat(rows) * cardHeight
        }
        return width < 60.0 ? 60.0 : width
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
                VStack {
                    Image(systemName: "shuffle")
                        .font(.largeTitle)
                    Text("New Game")
                        .font(.caption)
                }
            }
            
            Spacer()
            Button {
                gameVM.dealCards()
            } label: {
                VStack {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                    Text("Hit me!")
                        .font(.caption)
                }
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
