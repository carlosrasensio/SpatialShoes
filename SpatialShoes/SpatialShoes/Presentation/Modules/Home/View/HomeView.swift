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
    
    @State var viewModel: HomeViewModel
    @State private var selectedShoe: Shoe?

    // MARK: - View
    
    var body: some View {
        NavigationSplitView {
            if viewModel.showLoader {
                ProgressView(Localizables.loaderText)
            } else {
                List(selection: $selectedShoe) {
                    ForEach(viewModel.shoes) { shoe in
                        Text(shoe.name)
                            .font(.headline)
                            .tag(shoe)
                    }
                }
                .navigationTitle(Localizables.navigationtitle)
                .navigationSplitViewColumnWidth(250)
                .background(Color.blue.opacity(0.5))
                .foregroundColor(.white)
            }
        } content: {
            if let selectedShoe {
                InfoPanelFactory.make(with: selectedShoe)
            }
        } detail: {
            if let selectedShoe {
                RealityPanelFactory.make(with: selectedShoe)
            }
        }
        .background(Color.blue.opacity(0.2))
        .onAppear(perform: {
            viewModel.loadShoes()
        })
        .alert(Localizables.alertTitle,
               isPresented: $viewModel.showAlert)
        {} message: {
            Text(viewModel.errorMessage)
        }
    }
}

// MARK: - Localizables

private extension HomeView {
    enum Localizables {
        static let navigationtitle = "Catálogo"
        static let loaderText = "Cargando..."
        static let alertTitle = "ERROR"
    }
}
