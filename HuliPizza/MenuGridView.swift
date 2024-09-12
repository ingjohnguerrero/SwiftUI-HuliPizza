//
//  MenuGridView.swift
//  HuliPizza
//
//  Created by John Guerrero on 9/12/24.
//

import SwiftUI

struct MenuGridView: View {
    var menu: [MenuItem]
    @State private var favorites: [Int] = [-1]

    func menu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    @Binding var selectedItem: MenuItem
    let columnLayout = Array(repeating: GridItem(), count: 3)
    let favoriteLayout = Array(repeating: GridItem(), count: 5)
    @Namespace private var nspace
    var body: some View {
        VStack {
            LazyVGrid(columns: favoriteLayout) {
                ForEach(favorites.sorted(), id:\.self) { itemId in
                    FavoriteTileView(menuItem: menu(id: itemId))
                        .matchedGeometryEffect(id: itemId, in: nspace)
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
//            Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnLayout, content: {
                    ForEach(menu) { item in
                        if !favorites.contains(item.id) {
                            MenuItemTileView(menuItem: item)
                                .animation(.easeOut, value: favorites)
                                .matchedGeometryEffect(id: item.id, in: nspace)
                                .onTapGesture(count: 2) {
                                    if  !favorites.contains(item.id) {
                                        withAnimation(.easeOut) {
                                            favorites.append(item.id)
                                        }
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
        .animation(.easeOut(duration: 0.5), value: favorites)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
}
