//
//  OrderView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct OrderView: View {
    var orders: [Int]
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                ForEach(orders, id: \.self) { order in
                    OrderRowView(order: order)
                        .padding(.bottom, 5)
                        .padding([.leading, .trailing], 7)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 10)
                }
            }.padding(.top, 55)

            HStack {
                //                Label("Cart", systemImage: "cart")
                Text("Order Pizza")
                    .font(.title)
                Spacer()
                Label {
                    Text(59.99, format: .currency(code: "USD"))
                }
                icon: {
                    Image(systemName: orders.isEmpty ? "cart" : "cart.circle.fill")
                }
            }
            .padding([.leading, .trailing], 15)
            .padding([.top, .bottom], 10)
            .background(.ultraThinMaterial)
        }
        .padding()
        .background(Color.cyan)
    }
}

#Preview {
    OrderView(orders: [1, 2, 3, 4, 5])
}
