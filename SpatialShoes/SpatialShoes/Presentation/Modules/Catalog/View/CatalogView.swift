//
//  CatalogView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI
import RealityKit

struct CatalogView: View {
    
    // MARK: - Private Properties
    
    @Environment(CatalogViewModel.self) private var viewModel

    // MARK: - View
    
    var body: some View {
        @Bindable var viewModelBindable = viewModel
        
        NavigationSplitView {
            if viewModel.showLoader {
                ProgressView(Localizables.loaderText)
            } else {
                List(selection: $viewModelBindable.selectedShoe) {
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
            if let selectedShoe = viewModel.selectedShoe {
                InfoPanelView(shoe: selectedShoe)
            }
        } detail: {
            if let selectedShoe = viewModel.selectedShoe {
                RealityPanelFactory.make(with: selectedShoe)
            }
        }
        .background(Color.blue.opacity(0.2))
        .onAppear(perform: {
            viewModel.loadShoes()
        })
        .alert(Localizables.alertTitle,
               isPresented: $viewModelBindable.showAlert)
        {} message: {
            Text(viewModel.errorMessage)
        }
    }
}

// MARK: - Localizables

private extension CatalogView {
    enum Localizables {
        static let navigationtitle = Global.Localizables.catalog
        static let loaderText = "Cargando..."
        static let alertTitle = "ERROR"
    }
}
