//
//  AnyTransition+OffsetWithOpacity.swift
//  SetGame
//
//  Created by Charlie on 2021/2/2.
//

import SwiftUI

extension AnyTransition {
    static func offsetWithOpacity(width: CGFloat, height: CGFloat) -> AnyTransition {
        AnyTransition.offset(CGSize(width: width, height: height)).combined(with: .opacity)
    }
}
