//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by John Guerrero on 9/12/24.
//

import SwiftUI

struct MenuGridView: View {
    var menu: [MenuItem]
    @State var selectedItem: MenuItem = noMenuItem
    let columnLayout = Array(repeating: GridItem(), count: 3)
    var body: some View {
        VStack {
            Text(selectedItem.name)
            LazyVGrid(columns: columnLayout, content: {
                ForEach(menu) { item in
                    MenuItemTileView(menuItem: item)
                }
            })
        }
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu)
}
