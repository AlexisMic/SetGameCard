//
//  CardView.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/16/22.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var backgroundColor: Color {
        var color = card.isSelected ? Color.yellow : Color.white
        color = card.isWronglySelected ? Color.red : color
        color = card.isMatched ? Color.green : color
        return color
    }
        
    var body: some View {
        
        let cardShape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
        GeometryReader { geometry in
            ZStack {
                cardShape
                    .fill()
                    .foregroundColor(card.isSelected ? backgroundColor : .white)
                    .opacity(card.isSelected ? 0.10 : 1)
                cardShape
                    .strokeBorder(lineWidth: card.isSelected ? 4 : 3)
                    .foregroundColor(card.isSelected ? backgroundColor : .gray)
                cardContent

            }
        }
    }
    
    @ViewBuilder
    private var cardContent: some View {
        VStack {
            ForEach(0..<card.cardNumber.rawValue, id:\.self) { _ in
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
        Group {
            CardView(card: card)
            
            CardView(card: card)
                .preferredColorScheme(.dark)
        }
    }
}
