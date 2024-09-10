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
        HStack(alignment: .firstTextBaseline) {
            Text("Yout Order item \(order)")
            Spacer()
            Text(19.90, format: .currency(code: "USD"))
        }
    }
}

#Preview {
    OrderRowView(order: 1)
}
