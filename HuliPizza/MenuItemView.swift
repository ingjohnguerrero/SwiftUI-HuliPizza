//
//  MenuItemView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct MenuItemView: View {
    @State var addedItem: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Margherita Huli Pizza")
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
                if let image = UIImage(named: "0_lg") {
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
                    Text("Bavarian bergkase hard cheese feta. Jarlsberg monterey jack smelly cheese taleggio cut the cheese the big cheese babybel lancashire. Mascarpone smelly cheese boursin stinking bishop cheesy grin cauliflower cheese cheeseburger gouda. Emmental halloumi macaroni cheese roquefort mascarpone roquefort rubber cheese cheesy feet. Edam cheese triangles cheese on toast.")
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
                Button() {
                    addedItem.toggle()
                } label: {
                        Spacer()
                        Text(12.99, format: .currency(code: "USD"))
                            .foregroundStyle(.thickMaterial)
                        Image(systemName: addedItem ? "cart.badge.plus" : "cart.fill.badge.plus")
                            .foregroundStyle(.thickMaterial)
                        Spacer()
                }
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 8)
                .background(.red, in: Capsule())
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    MenuItemView()
}
