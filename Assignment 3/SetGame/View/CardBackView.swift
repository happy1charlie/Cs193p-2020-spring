//
//  File.swift
//  Set Game
//
//  Created by Charlie on 2021/2/1.
//

import SwiftUI

struct CardBackView: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
            .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
            .aspectRatio(4/7, contentMode: .fit)
            .cornerRadius(5)
    }
}
