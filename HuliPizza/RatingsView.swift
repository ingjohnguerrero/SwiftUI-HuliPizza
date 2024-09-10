//
//  RatingsView.swift
//  HuliPizza
//
//  Created by John Edwin Guerrero Ayala on 3/28/24.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    var body: some View {
        HStack {
            ForEach(1...6, id: \.self) { item in
//                if item <= rating {
//                    Image(systemName: "fork.knife.circle.fill")
//                } else {
//                    Image(systemName: "circle")
//                }
                Image(systemName: item <= rating ? "fork.knife.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    RatingsView(rating: 4)
}
