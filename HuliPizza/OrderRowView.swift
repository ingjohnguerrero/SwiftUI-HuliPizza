//
//  OrderRowView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                HStack {
                    Text(order.item.name)
                    Text("- Crust: \(order.item.crust.rawValue)")
                    if order.extraIngredients {Image(systemName: "2.circle")}
                    Spacer()
                    Text(order.name)
                }
                HStack {
                    Text(order.quantity, format: .number)
                    Text(order.item.price, format: .currency(code: "USD"))
                    Spacer()
                    Text(order.extPrice, format: .currency(code: "USD"))
                        .fontWeight(.semibold)
                }
            }
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}
