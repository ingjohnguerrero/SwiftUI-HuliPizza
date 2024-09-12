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
    @State var pizzaCrust: PizzaCrust
    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }
    var body: some View {
        VStack {
            Toggle(isOn: $doubleIngredients, label: {
                Text("Double Ingedients " + (doubleIngredients ? "Yes": "No"))
            })
            Stepper(value: $quantity, in: 1...10) {
                Text("\(quantity) " + (quantity==1 ? "pizza" : "pizzas"))
            }
            Picker(selection: $pizzaCrust) {
                ForEach(PizzaCrust.allCases, id: \.self) { crust in
                    Text(crust.rawValue)
                }
            } label: {
                Text("Pizza crust")
            }
            .pickerStyle(.menu)

            Spacer()
        }
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
