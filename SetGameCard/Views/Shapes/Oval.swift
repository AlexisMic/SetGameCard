//
//  Oval.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/17/22.
//

import SwiftUI

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.midX / 2, y: rect.midY)
        let radius = rect.midX / 2
        let bottomRight = CGPoint(x: rect.maxX * 3/4, y: rect.maxY )
        let centerRight = CGPoint(x: rect.maxX * 3/4, y: rect.midY)
        let topLeft = CGPoint(x: rect.maxX * 1/4, y: rect.minY)
        
        var p = Path()
        
        p.move(to: start)
        p.addArc(center: start, radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 90), clockwise: true)
        p.addLine(to: bottomRight)
        p.addArc(center: centerRight, radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 270), clockwise: true)
        p.addLine(to: topLeft)
        
        return p
    }
}
