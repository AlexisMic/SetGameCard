//
//  CardView.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/16/22.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
        
    var body: some View {
        
        let cardShape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
        ZStack {
            cardShape
                .fill()
                .foregroundColor(card.isSelected ? .white : .white)
//                .opacity(card.isSelected ? 0.50 : 1)
            cardShape
                .strokeBorder(lineWidth: card.isSelected ? 4 : 3)
                .foregroundColor(card.isSelected ? .orange : .gray)
            cardContent
        }
//        .aspectRatio(2/3, contentMode: .fit)
//        .frame(width: DrawingConstants.cardWidth, height: DrawingConstants.cardWidth * 3/2)
    }
    
    private var cardContent: some View {
        VStack {
            ForEach(0..<card.cardNumber.rawValue) { _ in
                cardShape
                    .foregroundColor(card.cardColor)
                    .aspectRatio(Constants.aspectRatioContent, contentMode: .fit)
                    .padding(.vertical, Constants.paddingVertical)
                    .padding(.horizontal, Constants.paddingHorizontal)
            }
        }
    }
    
    @ViewBuilder
    private var cardShape: some View {
        
        if card.cardShading == .open {
            switch card.cardShape {
            case .diamond:
                Diamond()
                    .stroke(lineWidth: 3)
            case .rectangle:
                Rectangle()
                    .stroke(lineWidth: 3)
            case .oval:
                Oval()
                    .stroke(lineWidth: 3)
            }
        } else {
            switch card.cardShape {
            case .diamond:
                Diamond()
                    .opacity(card.cardShading.rawValue)
            case .rectangle:
                Rectangle()
                    .opacity(card.cardShading.rawValue)
            case .oval:
                Oval()
                    .opacity(card.cardShading.rawValue)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(id: 1, cardNumber: CardNumber.two, cardShading: CardShading.open, cardColor: .red, cardShape: CardShape.oval, isSelected: true, isDistributed: true)
        CardView(card: card)
    }
}
