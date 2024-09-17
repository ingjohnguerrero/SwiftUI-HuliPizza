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
            NavigationStack {
                List($orders.orderItems) { $order in
                    NavigationLink(value: order) {
                        OrderRowView(order: $order)
                            .padding(4)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                    }
                }
                .navigationTitle("Your Order")
                // Move the navigationDestination outside the List
                .navigationDestination(for: OrderItem.self) { order in
                    OrderDetailView(orderItem: $orders.orderItems[orders.orderItems.firstIndex(where: { $0.id == order.id })!], presentSheet: .constant(false), newOrder: .constant(false))
                }
            }
            .padding(.top, 70)

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
