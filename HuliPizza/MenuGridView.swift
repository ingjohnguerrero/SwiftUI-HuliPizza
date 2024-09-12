//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by John Guerrero on 9/12/24.
//

import SwiftUI

struct MenuGridView: View {
    @State private var favorites: [Int] = [-1]

    func menu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }

    var menu: [MenuItem]
    @State var selectedItem: MenuItem = noMenuItem
    let columnLayout = Array(repeating: GridItem(), count: 3)
    let favoriteLayout = Array(repeating: GridItem(), count: 5)
    var body: some View {
        VStack {
            LazyVGrid(columns: favoriteLayout) {
                ForEach(favorites.sorted(), id:\.self) { itemId in
                    FavoriteTileView(menuItem: menu(id: itemId))
                        .onTapGesture {
                            selectedItem = menu(id: itemId)
                        }
                        .onLongPressGesture {
                            if let foundIndex = favorites.firstIndex(where: { $0 == itemId }) {
                                favorites.remove(at: foundIndex)
                            }
                        }
                }
            }
            Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnLayout, content: {
                    ForEach(menu) { item in
                        if !favorites.contains(item.id) {
                            MenuItemTileView(menuItem: item)
                                .onTapGesture(count: 2) {
                                    if  !favorites.contains(item.id) {
                                        favorites.append(item.id)
                                    }
                                }
                                .onTapGesture {
                                    selectedItem = item
                                }
                                .onTapGesture(count: 2) {
                                    favorites.append(item.id)
                                }
                                .onLongPressGesture {
                                    selectedItem = noMenuItem
                                }
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu)
}
