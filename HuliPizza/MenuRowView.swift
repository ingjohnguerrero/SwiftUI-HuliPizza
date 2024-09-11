//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct MenuRowView: View {
    var item: MenuItem
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            if let image = UIImage(named: "\(item.id)_sm") {
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
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price, format: .currency(code: "USD"))
                }
//                Text("Description")
                RatingsView(rating: item.rating)
            }
            Spacer()
        }
    }
}

#Preview {
    MenuRowView(item: testMenuItem)
}
