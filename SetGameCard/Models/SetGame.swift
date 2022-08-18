//
//  SetGame.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/16/22.
//

import Foundation

struct SetGame {
    
    private(set) var cards: Array<Card>
    
    private var currentCardOnTheDeck: Int? {
        cards.firstIndex(where: {!$0.isDistributed})
    }
    
    var numberOfCardsDistributed: Int {
        cards.filter({$0.isDistributed}).count
    }
    
    private var selectedCards: [Card] {
        cards.filter({$0.isSelected})
    }
    
    init() {
        self.cards = []
        var cardID = 0
        for shape in CardShape.allCases {
            for shade in CardShading.allCases {
                for number in CardNumber.allCases {
                    for color in possibleColors {
                        let card = Card(id: cardID, cardNumber: number, cardShading: shade, cardColor: color, cardShape: shape)
                        cards.append(card)
                        cardID += 1
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    mutating func dealCards() {
        if let currentCardOnTheDeck = currentCardOnTheDeck {
            if currentCardOnTheDeck < cards.count {
                for index in (currentCardOnTheDeck..<currentCardOnTheDeck+3) {
                    self.cards[index].isDistributed = true
                }
            }
        }
    }
    
    mutating func chooseCard(card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isMatched && !cards[chosenIndex].isWronglySelected {
                cards[chosenIndex].isSelected.toggle()
            } else {
                verifyIfItIsASet()
                cards[chosenIndex].isSelected.toggle()
            }
            if selectedCards.count == 3 {
                if cardsAreSet() {
                    // mostra que acertou
                    cards.indices.forEach { index in
                        if cards[index].isSelected {
                            cards[index].isMatched = true
                        }
                    }
                } else {
                    // mostra que errou
                    cards.indices.forEach { index in
                        if cards[index].isSelected {
                            cards[index].isWronglySelected = true
                        }
                    }
                }
            }
            if selectedCards.count == 4 {
                verifyIfItIsASet()
            }
            
        }
        
        func verifyIfItIsASet() {
            if cards.allSatisfy({$0.isWronglySelected == false}) {
                // remove as cartas que acertaram
                cards.removeAll(where: {$0.isMatched})
                dealCards()
            } else {
                // Cancela a seleção das cartas erradas
                cards.indices.forEach { index in
                    if cards[index].isWronglySelected {
                        cards[index].isSelected = false
                        cards[index].isWronglySelected = false
                    }
                }
            }
        }
    }
    
    private func cardsAreSet() -> Bool {
        let numberTest = Set(selectedCards.map{$0.cardNumber}).count != 2
        let shapeTest = Set(selectedCards.map{$0.cardShape}).count != 2
        let shadeTest = Set(selectedCards.map{$0.cardShading}).count != 2
        let colorTest = Set(selectedCards.map{$0.cardColor}).count != 2
        
        return numberTest && shadeTest && shapeTest && colorTest
    }
    
}


