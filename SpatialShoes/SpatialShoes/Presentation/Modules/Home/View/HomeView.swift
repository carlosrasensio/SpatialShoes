//
//  HomeView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI
import RealityKit

struct HomeView: View {
    
    // MARK: - Private Properties
    
    @ObservedObject var viewModel: HomeViewModel

    // MARK: - View
    
    var body: some View {
        NavigationView {
            List(viewModel.shoes) { shoe in
                NavigationLink(destination: DetailFactory.make(with: shoe)) {
                    HStack {
                        Text(shoe.name)
                            .font(.headline)
                        Spacer()
                        Text(String(format: "$%.2f", shoe.price))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle(Constants.navigationtitle)
        }
    }
}

// MARK: - Constants

private extension HomeView {
    enum Constants {
        static let navigationtitle = "Shoes Catalog"
    }
}

// MARK: - Preview

#Preview(windowStyle: .automatic) {
    HomeView(viewModel: HomeViewModel(repository: ShoeDataRepository()))
}
