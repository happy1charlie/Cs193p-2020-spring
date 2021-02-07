//
//  OptinalImage.swift
//  EmojiArt
//
//  Created by Charlie on 2021/2/7.
//

import SwiftUI

struct OptinalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}


