//
//  ContentView.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/15/22.
//

import SwiftUI

struct SetGameView: View {
    
    @ObservedObject var gameVM: GameViewModel
    
    @Namespace private var dealingCardsNameSpace
    @Namespace private var removingCardsNameSpace
    
    @State var deal3Cards = 1

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                title
                gameBoard
                
                ZStack(alignment: .bottom) {
                    buttons
                    deckBoard
                }
            }
            
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
    
    private var title: some View {
        Text("Set Game")
            .font(.largeTitle)
            .padding()
    }
    
    private var gameBoard: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    LazyVGrid(columns: [adaptativeGrid(widht: adaptiveWidth(size: geometry.size, aspectRatio: Constants.aspectRatioCard))]) {
                        ForEach (gameVM.cards) { card in
                            if card.isDistributed && !card.isRemoved {
                                CardView(card: card)
                                    .aspectRatio(Constants.aspectRatioCard, contentMode: .fit)
                                    .matchedGeometryEffect(id: card.id, in: dealingCardsNameSpace)
                                    .matchedGeometryEffect(id: card.id, in: removingCardsNameSpace)
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
    }
    
    @ViewBuilder
    private var deckBoard: some View {
        HStack {
            ZStack {
                ForEach(gameVM.cards.filter({$0.isRemoved})) { card in
                    CardView(card: card)
                        .matchedGeometryEffect(id: card.id, in: removingCardsNameSpace)
                        .onAppear {
                            if deal3Cards == 3 {
                                gameVM.dealCards()
                                deal3Cards = 1
                            }
                            deal3Cards += 1
                        }
                }
                
            }
            .frame(width: 60, height: 90)
            Spacer()
            ZStack {
                ForEach(gameVM.cards.filter({!$0.isDistributed})) { card in
                    CardView(card: card)
                        .matchedGeometryEffect(id: card.id, in: dealingCardsNameSpace)
                        .onTapGesture {
                            gameVM.dealCards()
                        }
                        .disabled(gameVM.areAllCardsDistributed)
                }
                .frame(width: 60, height: 90)
            }
        }
        .padding(.horizontal)
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
        }
        .padding(.horizontal, 50)
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let gameVMPreview = GameViewModel()
        gameVMPreview.dealCards()
        return Group {
            SetGameView(gameVM: gameVMPreview)
                .previewInterfaceOrientation(.portrait)
            
            SetGameView(gameVM: gameVMPreview)
                .preferredColorScheme(.dark)
        }
    }
}
