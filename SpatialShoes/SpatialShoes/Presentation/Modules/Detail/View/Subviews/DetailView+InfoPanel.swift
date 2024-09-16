//
//  DetailView+InfoPanel.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 16/9/24.
//

import SwiftUI

extension DetailView {
    @ViewBuilder
    func createInfoPanel() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            createInfoPanelCell(propertyTitle: "Marca", propertyValue: shoe.brand)
            createInfoPanelCell(propertyTitle: "Tallas", propertyValue: shoe.size.map { String($0) }.joined(separator: ", "))
            createInfoPanelCell(propertyTitle: "Precio", propertyValue: "\(shoe.price) €")
            createInfoPanelCell(propertyTitle: "Descripción", propertyValue: shoe.description)
            createInfoPanelCell(propertyTitle: "Tipo", propertyValue: shoe.type)
            createInfoPanelCell(propertyTitle: "Materiales", propertyValue: shoe.materials.joined(separator: ", "))
            createInfoPanelCell(propertyTitle: "Origen", propertyValue: shoe.origin)
            createInfoPanelCell(propertyTitle: "Género", propertyValue: shoe.gender)
            createInfoPanelCell(propertyTitle: "Peso", propertyValue: "\(shoe.weight) kg")
            createInfoPanelCell(propertyTitle: "Colores", propertyValue: shoe.colors.joined(separator: ", "))
            createInfoPanelCell(propertyTitle: "Garantía", propertyValue: "\(shoe.weight) años")
            createInfoPanelCell(propertyTitle: "Certificaciones", propertyValue: shoe.certifications.joined(separator: ", "))
        }
        .padding()
    }
}

// MARK: - Private Functions

private extension DetailView {
    @ViewBuilder
    func createInfoPanelCell(propertyTitle: String,
                             propertyValue: String) -> some View {
        HStack(alignment: .top) {
            Text("\(propertyTitle): ")
                .font(.headline)
                .foregroundColor(.primary)
            Text(propertyValue)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 2)
    }
}
