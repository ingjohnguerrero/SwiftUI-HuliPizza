//
//  OrderItemView.swift
//  HuliPizza
//
//  Created by John Guerrero on 9/11/24.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem: OrderItem
    @State private var quantity = 1
    @State private var doubleIngredients = false
    var body: some View {
        VStack {
            Toggle(isOn: $doubleIngredients, label: {
                Text("Double Ingedients " + (doubleIngredients ? "Yes": "No"))
            })
            Stepper(value: $quantity, in: 1...10) {
                Text("\(quantity) " + (quantity==1 ? "pizza" : "pizzas"))
            }
        }
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
