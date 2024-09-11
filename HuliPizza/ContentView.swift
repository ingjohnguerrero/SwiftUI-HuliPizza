//
//  ContentView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    var orders: [Int] = [1, 2, 3, 4, 5]
    @State var showOrders: Bool = true
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
            Button() {
                showOrders.toggle()
            } label: {
                Image(systemName: showOrders ? "cart" : "menucard")
            }
            .foregroundStyle(.secondary)
            if showOrders {
                OrderView(orders: orders)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                MenuItemView()
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                MenuView()
            }
            Spacer()
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
    }
}

#Preview {
    ContentView()
}
