//
//  VolumetricWindowView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 20/9/24.
//

import RealityKit
import SpatialShoesVolumetricScene
import SwiftUI

struct VolumetricWindowView: View {
    
    // MARK: - Private Properties
    
    @Environment(CatalogViewModel.self) private var catalogViewModel
    @State private var showAlert: Bool = false
    @State private var errorMessage: String = ""

    // MARK: - View
    
    var body: some View {
        RealityView { content in
            guard let selectedShoe = catalogViewModel.selectedShoe else { return }
            do {
                let shoe = try await Entity(named: selectedShoe.model3DName, in: spatialShoesVolumetricSceneBundle)
                content.add(shoe)
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
            if let selectedShoe = catalogViewModel.selectedShoe {
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
      static let loaderText = Global.Localizables.loaderText
      static let alertTitle = Global.Localizables.Errors.alertTitle
      static let unknownError = Global.Localizables.Errors.unknown
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
