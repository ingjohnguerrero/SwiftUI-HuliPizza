//
//  MenuView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct MenuView: View {
    var menu: [MenuItem]
    var body: some View {
        ScrollView {
            ForEach(menu) { item in
                MenuRowView(item: item)
            }
        }
    }
}

#Preview {
    MenuView(menu: MenuModel().menu)
}
