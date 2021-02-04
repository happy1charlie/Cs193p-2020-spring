//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Charlie on 2021/2/3.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentVIew(document: EmojiArtDocument())
        }
    }
}
