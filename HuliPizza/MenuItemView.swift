//
//  MenuItemView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct MenuItemView: View {
    var body: some View {
        VStack {
//                Image(systemName: "rectangle.fill").font(.largeTitle)
            if let image = UIImage(named: "0_lg") {
                    Image(uiImage: image)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .cornerRadius(10)

            } else {
                Image("surfboard_lg")
            }
            VStack(alignment: .leading) {
                Text("Margherita")
                    .font(.title)
//                    .bold()
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Surf"))
                    .padding(.leading)
                    .background(
                        .linearGradient(
                            colors: [Color("Surf"), Color("Sky").opacity(0.1)],
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        in: Capsule()
                    )
                ScrollView {
                    Text("Bavarian bergkase hard cheese feta. Jarlsberg monterey jack smelly cheese taleggio cut the cheese the big cheese babybel lancashire. Mascarpone smelly cheese boursin stinking bishop cheesy grin cauliflower cheese cheeseburger gouda. Emmental halloumi macaroni cheese roquefort mascarpone roquefort rubber cheese cheesy feet. Edam cheese triangles cheese on toast.")
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
            }
        }
    }
}

#Preview {
    MenuItemView()
}
