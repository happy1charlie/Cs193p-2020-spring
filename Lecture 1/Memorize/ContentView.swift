//
//  ContentView.swift
//  Memorize
//
//  Created by Charlie on 2020/12/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<7) { index in
                CardView()
            }
        }
        .padding()
        .font(Font.largeTitle)
        .foregroundColor(.gray)
    }
}

struct CardView: View {
    var faceup: Bool = true
    var body: some View {
        ZStack {
            if faceup{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.gray)
                RoundedRectangle(cornerRadius:10.0).stroke(lineWidth: 3.0)
                Text("😍")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
