//
//  Diamond.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/17/22.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.minX, y: rect.midY)
        let top = CGPoint(x: rect.midX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.minY)
        
        var p = Path()
        p.move(to: start)
        p.addLine(to: top)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.addLine(to: start)
        
        return p
    }
}
