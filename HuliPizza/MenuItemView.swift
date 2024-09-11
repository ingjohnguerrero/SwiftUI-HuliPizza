//
//  MenuItemView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct MenuItemView: View {
    @State var addedItem: Bool = false
    @Binding var item: MenuItem
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
            HStack {
                Text(item.name)
                    .font(.title)
                //                    .bold()
                    .fontWeight(.semibold)
                //                    .foregroundColor(Color("Surf"))
//                    .foregroundStyle(.thickMaterial)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
//                    .frame(width: 200, height: 150)
//                    .frame(
//                        minWidth: 150,
//                        maxWidth: 1000,
//                        maxHeight: 300
//                    )
                //                Image(systemName: "rectangle.fill").font(.largeTitle)
                if let image = UIImage(named: "\(item.id)_lg") {
                    Image(uiImage: image)
                    //                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        .resizable()
                        .scaledToFit()
                        .padding([.top, .bottom], 5)
                        .cornerRadius(10)

                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                }
            }
            .background(
                .linearGradient(
                    colors: [Color("Surf"), Color("Sky").opacity(0.1)],
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                in: Capsule()
            )
            .shadow(color: .teal, radius: 5, x: 8, y: 8)
            VStack(alignment: .leading) {
                ScrollView {
                    Text(item.description)
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
                Button() {
                    addedItem.toggle()
                    orders.addOrder(item, quantity: 1)
                } label: {
                        Spacer()
                    Text(item.price, format: .currency(code: "USD"))
                            .foregroundStyle(.thickMaterial)
                        Image(systemName: addedItem ? "cart.badge.plus" : "cart.fill.badge.plus")
                            .foregroundStyle(.thickMaterial)
                        Spacer()
                }
                .disabled(item.id < 0)
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 8)
                .background(.red, in: Capsule())
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
}
