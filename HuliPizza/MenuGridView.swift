//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by John Guerrero on 9/12/24.
//

import SwiftUI

struct MenuGridView: View {
    @State private var favorites: [MenuItem] = [noMenuItem]
    var menu: [MenuItem]
    @State var selectedItem: MenuItem = noMenuItem
    let columnLayout = Array(repeating: GridItem(), count: 3)
    let favoriteLayout = Array(repeating: GridItem(), count: 5)
    var body: some View {
        VStack {
            LazyHGrid(rows: favoriteLayout) {
                ForEach(favorites) { item in
                    FavoriteTileView(menuItem: item)
                        .onLongPressGesture {
                            let foundIndex = favorites.firstIndex { favorite in
                                favorite.id == item.id
                            }
                            guard let foundIndex else { return }
                            favorites.remove(at: foundIndex)
                        }
                }
            }
            Text(selectedItem.name)
            LazyVGrid(columns: columnLayout, content: {
                ForEach(menu) { item in
                    if let foundIndex = favorites.firstIndex { $0.id == item.id } {

                    } else {
                        MenuItemTileView(menuItem: item)
                            .onTapGesture(count: 2) {
                                favorites.append(item)
                            }
                            .onTapGesture {
                                selectedItem = item
                                //favorites.append(item)
                            }
                            .onTapGesture(count: 2) {
                                favorites.append(item)
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

#Preview {
    MenuGridView(menu: MenuModel().menu)
}
