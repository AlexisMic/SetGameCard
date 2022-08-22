//
//  Cardify.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/22/22.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    let card: Card
    
    var backgroundColor: Color {
        var color = card.isSelected ? Color.yellow : Color.white
        color = card.isWronglySelected ? Color.red : color
        color = card.isMatched ? Color.green : color
        return color
    }
    
    func body(content: Content) -> some View {
        let cardShape = RoundedRectangle(cornerRadius: Constants.cornerRadius)

            ZStack {
                cardShape
                    .fill()
                    .foregroundColor(card.isSelected ? backgroundColor : .white)
                    .opacity(card.isSelected ? 0.10 : 1)
                cardShape
                    .strokeBorder(lineWidth: card.isSelected ? 4 : 3)
                    .foregroundColor(card.isSelected ? backgroundColor : .gray)
                content

            }

    }
}
