//
//  OrderRowView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct OrderRowView: View {
    var order: Int
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text("Yout Order item \(order)")
                HStack {
                    Text(1, format: .number)
                    Text("@")
                    Text(19.99, format: .currency(code: "USD"))
                }
            }
            Spacer()
            Text(19.90, format: .currency(code: "USD"))
                .fontWeight(.semibold)
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 10)
    }
}

#Preview {
    OrderRowView(order: 1)
}
