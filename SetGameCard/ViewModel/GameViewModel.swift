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
    
    //MARK: Intents
    
    // new cards
    func dealCards() {
        model.dealCards()
    }
    
    // new game
    func newGame() {
        model = SetGame()
    }
    
    func chooseCard(card: Card) {
        model.chooseCard(card: card)
    }
}
