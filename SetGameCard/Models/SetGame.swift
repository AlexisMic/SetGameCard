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
        cards.firstIndex(where: {$0.isDistributed == false})
    }
    
    private var selectedCards: [Card] {
        cards.filter({$0.isSelected == true})
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
            cards[chosenIndex].isSelected.toggle()
            if selectedCards.count == 3 {
                if cardsAreSet() {
                    //TODO: mostrar que acertou
                    cards.removeAll(where: {$0.isSelected == true})
                    dealCards()
                } else {
                    //TODO: mostrar que errou
                    cards.indices.forEach({cards[$0].isSelected = false})
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
    
//    private func isAllTheSameOrAllDiferente(item1: CardNumber, item2: CardNumber, item3: CardNumber) -> Bool {
//        let allSameItems = item1 == item2 && item2 == item3
//        let allDifferentItems = item1 != item2 && item1 != item3 && item2 != item3
//        
//        return allSameItems || allDifferentItems
//    }
    
}


