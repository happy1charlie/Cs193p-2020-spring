//
//  Pie.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/16.
//

import Foundation
import SwiftUI

struct Pie: Shape {
    var startedAngle: Angle
    var endedAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startedAngle.radians)),
            y: center.y + radius * sin(CGFloat(endedAngle.radians))
        )
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startedAngle,
                 endAngle: endedAngle,
                 clockwise: clockwise)
        p.addLine(to: center)
        
        return p
    }
}
