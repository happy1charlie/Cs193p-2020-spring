//
//  StrippedPatten.swift
//  SetGame
//
//  Created by Charlie on 2021/2/2.
//

import SwiftUI

struct ContnetBackgroundModifier: ViewModifier {
    var backgroundType: SetGameCard.Background
    
    func body(content: Content) -> some View {
        Group {
            switch backgroundType {
            case .empty:
                ZStack {
                    content.opacity(0)
                    Color.clear.mask(content)
                }
            case .solid:
                content
            case .stripped:
                ZStack {
                    content.opacity(0)
                    StripedPattern(stripeWidth: 2, interval: 2)
                    .mask(content)
                }
            }
        }
    }
}

extension View {
    func contentBackground(_ backgroundType: SetGameCard.Background) -> some View {
        self.modifier(ContnetBackgroundModifier(backgroundType: backgroundType))
    }
}


struct StripedPattern: Shape {
    var stripeWidth: Int
    var interval: Int
    
    func path(in rect: CGRect) -> Path {
        let numberOfStripes = Int(rect.width) / stripeWidth
        
        var path = Path()
        path.move(to: rect.origin)
        
        for index in 0...numberOfStripes {
            if index % interval == 0 {
                path.addRect(CGRect(
                                x: CGFloat(index * stripeWidth),
                                y: 0,
                                width: CGFloat(stripeWidth),
                                height: rect.height)
                )
            }
        }
        return path
    }
}
