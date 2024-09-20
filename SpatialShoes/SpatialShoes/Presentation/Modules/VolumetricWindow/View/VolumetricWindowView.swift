//
//  VolumetricWindowView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 20/9/24.
//

import RealityKit
import SpatialShoesScene
import SwiftUI

struct VolumetricWindowView: View {
    
    // MARK: - Private Properties
    
    @Environment(HomeViewModel.self) private var homeViewModel
    @State private var showAlert: Bool = false
    @State private var errorMessage: String = ""

    // MARK: - View
    
    var body: some View {
        RealityView { content in
            guard let selectedShoe = homeViewModel.selectedShoe else { return }
            do {
                let shoe = try await Entity(named: selectedShoe.model3DName, in: SpatialShoesScene.spatialShoesSceneBundle)
                content.add(shoe)
                shoe.position = []
            } catch let error as VolumetricWindowError {
                errorMessage = error.message
                showAlert = true
                print("❌ [ERROR] \(errorMessage)")
            } catch {
                errorMessage = Localizables.unknownError
                showAlert = true
                print("❌ [ERROR] \(errorMessage)")
            }
        } placeholder: {
            if let selectedShoe = homeViewModel.selectedShoe {
                ProgressView("\(selectedShoe) \(Localizables.loaderText.lowercased())")
            }
        }
        .alert(Localizables.alertTitle,
               isPresented: $showAlert)
        {} message: {
            Text(errorMessage)
        }
    }
}
                              
// MARK: - Localizables
                              
private extension VolumetricWindowView {
  enum Localizables {
      static let loaderText = "Cargando..."
      static let alertTitle = "ERROR"
      static let unknownError = "Error por determinar"
  }
}

// MARK: - VolumetricWindowError

enum VolumetricWindowError: Error {
    case shoeLoadError
    
    var message: String {
        switch self {
        case .shoeLoadError: Localizables.Errors.shoeLoad
        }
    }
}

// MARK: - VolumetricWindowError.Localizables

private extension VolumetricWindowError {
  enum Localizables {
      enum Errors {
          static let shoeLoad = "Error al cargar la zapatilla"
      }
  }
}
