//
//  Grid.swift
//  MemoryGame
//
//  Created by Charlie on 2021/1/11.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    
    init (items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            let layout = GridLayout(itemCount: items.count, in: geometry.size)
            
            ForEach(items) { item in
                let index = items.matchedIndex(matching: item)
                viewForItem(item)
                    .frame(width:layout.itemSize.width, height:layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!))
            }
        }
    }
    
   
}


//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
