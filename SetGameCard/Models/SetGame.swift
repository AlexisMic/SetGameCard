//
//  SetGame.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/16/22.
//

import Foundation

struct SetGame {
    
    private(set) var cards: Array<Card>
    
    init() {
        self.cards = []
        var cardID = 0
        for shape in CardShape.allCases {
            for shade in CardShading.allCases {
                for number in CardNumber.allCases {
                    for color in possibleColors {
                        let card = Card(id: cardID, cardNumber: number, cardShading: shade, cardColor: color, cardShape: shape, isSelected: false, isMatched: false)
                        cards.append(card)
                        cardID += 1
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    
    
}
