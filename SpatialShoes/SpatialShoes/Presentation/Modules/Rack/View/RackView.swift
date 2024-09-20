//
//  RackView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 19/9/24.
//

import SwiftUI

struct RackView: View {
    
    // MARK: - Properties

    let favoriteShoes: [Shoe]
    var onSelect: (Shoe) -> Void
    
    // MARK: - View
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16) {
                ForEach(favoriteShoes) { favoriteShoe in
                    Button(action: {
                        onSelect(favoriteShoe)
                    }) {
                        RackCellView(shoe: favoriteShoe)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Zapatillas Favoritas")
    }
}
