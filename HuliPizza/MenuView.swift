//
//  MenuView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView {
            ForEach(1...25, id: \.self) { item in
                MenuRowView(item: item)
            }
        }
    }
}

#Preview {
    MenuView()
}
