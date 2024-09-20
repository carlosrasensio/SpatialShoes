//
//  RackView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 19/9/24.
//

import SwiftUI

struct RackView: View {
    
    // MARK: - Properties

    @State var viewModel: RackViewModel
    let favoriteShoes: [Shoe] = []
    
    
    // MARK: - View
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16) {
                ForEach(favoriteShoes) { favoriteShoe in
                    Button(action: {
                        // TODO: Display window with InfoPanelView
                    }) {
                        RackCellView(shoe: favoriteShoe)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(Localizables.title)
    }
}

// MARK: - Localizables

private extension RackView {
    enum Localizables {
        static let title = "Zapatillas Favoritas"
    }
}
