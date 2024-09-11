//
//  OrderView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ScrollView {
                    ForEach($orders.orderItems) { order in
                        OrderRowView(order: order)
//                        Text(order.item.name)
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
                        Text(orders.orderTotal, format: .currency(code: "USD"))
                    }
                    icon: {
                        Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
                    }
                }
                .padding([.leading, .trailing], 15)
                .padding([.top, .bottom], 10)
                .background(.ultraThinMaterial)
            }
            .padding()
            Button("Delete Order") {
                if !orders.orderItems.isEmpty {
                    orders.orderItems.removeLast()
                }
            }
            .padding(5)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
    }
}

#Preview {
    OrderView(orders: OrderModel())
}
