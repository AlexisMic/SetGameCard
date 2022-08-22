//
//  GameViewModel.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/17/22.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published private var model = SetGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var numberOfDistributedCards: Int {
        model.numberOfCardsDistributed
    }
    
    var areAllCardsDistributed: Bool {
        model.cards.allSatisfy({$0.isDistributed})
    }
    
    //MARK: Intents
    
    // new cards
    func dealCards() {
        for delay in (0..<3) {
            withAnimation(.linear(duration: Constants.animationDuration).delay(Double(delay) * 0.2)) {
                model.dealCards()
            }
        }
    }
    
    // new game
    func newGame() {
        model = SetGame()
    }
    
    func chooseCard(card: Card) {
        withAnimation(.linear(duration: 1)) {
            model.chooseCard(card: card)
        }
    }
}
