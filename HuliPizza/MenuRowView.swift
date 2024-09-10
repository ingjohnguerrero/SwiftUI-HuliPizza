//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct MenuRowView: View {
    var item: Int
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            if let image = UIImage(named: "\(item)_sm") {
                Image(uiImage: image)
                    .clipShape(Circle())
                    .padding(.trailing, -20)
                    .padding(.leading, -15)
            } else {
                Image("surfboard_sm")
            }
//                        Image(systemName: "\(item).circle.fill")
//                    Image("0_sm")
            VStack(alignment: .leading) {
                Text("Margherita")
//                Text("Description")
                RatingsView(rating: 4)
            }
            Spacer()
        }
    }
}

#Preview {
    MenuRowView(item: 2)
}
