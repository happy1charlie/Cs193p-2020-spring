//
//  EmojiArtDocumentVIew.swift
//  EmojiArt
//
//  Created by Charlie on 2021/2/3.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    init(document: EmojiArtDocument) {
        self.document = document
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.emojiDeck.map { String($0) }, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: 40))
                            .onDrag { return NSItemProvider(object: emoji as NSString) }
                    }
                }
            }
        }
        .padding(.horizontal)
        GeometryReader { geometry in
            ZStack {
                Color.white.overlay(
                    OptinalImage(uiImage: self.document.backgroundImage)
                        .scaleEffect(zoomScale)
                        .offset(panOffset)
                   )
                .gesture(doubleTapToZoom(in: geometry.size))
                    
                ForEach(self.document.emojis) { emoji in
                    Text(emoji.text)
                        .font(animatableWithSize: emoji.fontSize * zoomScale)
                        .position(self.position(for: emoji, in: geometry.size))
                }
            }
            .clipped()
            .gesture(zoomGesture())
            .gesture(panGesture())
            .edgesIgnoringSafeArea(.bottom)
            .onDrop(of: ["public.image", "public.text"], isTargeted: nil) { providers, location in
                var location = geometry.convert(location, from: .global)
                location = CGPoint(x: location.x - geometry.size.width/2, y: location.y - geometry.size.height/2)
                location = CGPoint(x: location.x - panOffset.width, y: location.y - panOffset.height)
                location = CGPoint(x: location.x / zoomScale, y: location.y / zoomScale)
                return self.drop(providers: providers, at: location)
            }
        }
    }
    
    @State private var steadyStateZoomScale: CGFloat = 1.0
    @GestureState private var gestureZoomScale: CGFloat = 1.0
    
    private var zoomScale: CGFloat {
        steadyStateZoomScale * gestureZoomScale
    }
    
    private func zoomGesture() -> some Gesture {
        MagnificationGesture()
            .updating($gestureZoomScale) { latestGestureScale, ourGestureStateInOut, transaction in
                ourGestureStateInOut = latestGestureScale
            }
            .onEnded { finalGestureScale in
                steadyStateZoomScale *= finalGestureScale
            }
    }
    
    @State private var steadyStatePanOffset: CGSize = CGSize.zero
    @GestureState private var gesturePanOffset: CGSize = CGSize.zero
    
    private var panOffset: CGSize {
        (steadyStatePanOffset + gesturePanOffset) * zoomScale
    }
    
    private func panGesture() -> some Gesture {
        DragGesture()
            .updating($gesturePanOffset) { latestDragGestureValue, gesturePanOffset, transaction in
                gesturePanOffset = latestDragGestureValue.translation / zoomScale
            }
            .onEnded { finalDragGestureValue in
                steadyStatePanOffset = steadyStatePanOffset + (finalDragGestureValue.translation / zoomScale)
                
            }
    }
    
    
    private func doubleTapToZoom(in size: CGSize) -> some Gesture {
        TapGesture(count: 2)
            .onEnded {
                withAnimation {
                    zoomToFit(document.backgroundImage, in: size)
                }
            }
    }
    
    private func zoomToFit(_ image: UIImage?, in size: CGSize) {
        if let image = image, image.size.width > 0, image.size.height > 0 {
            let hZoom = size.width / image.size.width
            let vZoom = size.height / image.size.height
            steadyStatePanOffset = .zero
            steadyStateZoomScale = min(hZoom, vZoom)
        }
    }
    
    
    private func position(for emoji: EmojiArt.Emoji, in size: CGSize) -> CGPoint {
        var location = emoji.location
        location = CGPoint(x: location.x * zoomScale, y: location.y * zoomScale)
        location = CGPoint(x: emoji.location.x + size.width/2, y: emoji.location.y + size.height/2)
        location = CGPoint(x: location.x + panOffset.width, y: location.y + panOffset.height)
        return location
    }
    
    private func drop(providers: [NSItemProvider], at location: CGPoint) -> Bool {
        var found = providers.loadFirstObject(ofType: URL.self) { url in
            print("drop:\(url)")
            self.document.setBackgroundURL(url)
        }
        if !found {
            found = providers.loadObjects(ofType: String.self) { String in
                self.document.addEmoji(String, at: location, size: self.defaultEmojiSize)
            }
        }
        return found
    }
    
    private var defaultEmojiSize: CGFloat = 40
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmojiArtDocumentVIew()
//    }
//}
