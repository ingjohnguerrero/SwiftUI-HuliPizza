//
//  ContentView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @State private var orders: [OrderItem] = testOrders
    @State private var showOrders: Bool = true
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
            HStack {
                Text("\(orders.count) orders")
                Spacer()
                Button() {
                    showOrders.toggle()
                } label: {
                    Image(systemName: showOrders ? "cart" : "menucard")
                }
            }
            .foregroundStyle(.white)
            .font(.title2)

            if showOrders {
                OrderView(orders: $orders)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                MenuItemView()
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                MenuView(menu: menu)
            }
            Spacer()
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}
