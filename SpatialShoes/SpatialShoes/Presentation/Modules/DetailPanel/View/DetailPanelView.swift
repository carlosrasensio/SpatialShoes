//
//  DetailPanelView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import SwiftUI

struct DetailPanelView: View {
    
    // MARK: - Properties
    
    var shoe: Shoe
    
    // MARK: - View
    
    var body: some View {
        Form {
            Section {
                LabeledContent("**\(Localizables.brand)**", value: shoe.brand)
                LabeledContent("**\(Localizables.size)**", value: shoe.size.map { String($0) }.joined(separator: ", "))
                LabeledContent("**\(Localizables.price)**", value: "\(shoe.price) €")
                LabeledContent("**\(Localizables.type)**", value: shoe.type)
                LabeledContent("**\(Localizables.materials)**", value: shoe.materials.joined(separator: ", "))
                LabeledContent("**\(Localizables.origin)**", value: shoe.origin)
                LabeledContent("**\(Localizables.gender)**", value: shoe.gender)
                LabeledContent("**\(Localizables.weight)**", value: "\(shoe.weight) kg")
                LabeledContent("**\(Localizables.colors)**", value: shoe.colors.joined(separator: ", "))
                LabeledContent("**\(Localizables.warranty)**", value: "\(shoe.warranty) años")
                LabeledContent("**\(Localizables.certifications)**", value: shoe.certifications.joined(separator: ", "))
            } header: {
                Text("**Información**")
            }
            
            Section {
                Text(shoe.description)
            } header: {
                Text("**\(Localizables.description)**")
            }
        }
        .navigationTitle(shoe.name)
        .background(Color.blue.opacity(0.4))
        .foregroundColor(.white)
    }
}

// MARK: - Localizables

private extension DetailPanelView {
    enum Localizables {
        static let description = "Descripción"
        static let brand = "Marca"
        static let size = "Tallas"
        static let price = "Precio"
        static let type = "Tipo"
        static let materials = "Materiales"
        static let origin = "Orígen"
        static let gender = "Género"
        static let weight = "Peso"
        static let colors = "Colores"
        static let warranty = "Garantía"
        static let certifications = "Certificaciones"
        static let info = "Información"
    }
}
