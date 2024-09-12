//
//  HeaderView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("surfBanner")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                Text("Huli Pizza Company")
                    .font(.custom("Georgia", size: 30, relativeTo: .title))
    //                .foregroundColor(Color("Sky"))
                    .foregroundStyle(.regularMaterial)
                    .fontWeight(.semibold)
            }
            Label {
                Text(orders.orderTotal, format: .currency(code: "USD"))
            }
        icon: {
            Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
        }
        }
        .background(.ultraThickMaterial)
    }
}

#Preview {
    HeaderView().environmentObject(OrderModel())
}
