//
//  DiamondShape.swift
//  Set Game
//
//  Created by Charlie on 2021/2/1.
//

import SwiftUI

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.closeSubpath()
        
        return path
    }
}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        DiamondShape()
    }
}
