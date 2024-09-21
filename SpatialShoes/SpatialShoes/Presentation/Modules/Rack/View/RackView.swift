//
//  RackView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 19/9/24.
//

import SwiftUI

struct RackView: View {
    
    // MARK: - Public Properties

    @State var viewModel: RackViewModel

    // MARK: - Private Properties
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - View
    
    var body: some View {
        if favoriteShoes.isEmpty {
            ContentUnavailableView(Localizables.emptyRackTitle,
                                   systemImage: "heart.slash",
                                   description: Text(Localizables.emptyRackDescription))
        }
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.favoriteShoes) { favoriteShoe in
                    createShelf(with: favoriteShoe)
                }
            }
            .padding()
        }
        .navigationTitle(Global.Localizables.favorites)
        .onAppear {
            viewModel.startRotation()
        }
    }
}

// MARK: - Localizables

private extension RackView {
    enum Localizables {
        static let emptyRackTitle = "Vaya.."
        static let emptyRackDescription = "Parece que actualmente no tienes zapatillas guardadas en Favoritos"
    }
}
