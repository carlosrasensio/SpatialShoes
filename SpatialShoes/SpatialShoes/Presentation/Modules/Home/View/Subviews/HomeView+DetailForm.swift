//
//  HomeView+DetailForm.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import SwiftUI

extension HomeView {
    @ViewBuilder
    func createDetailForm(with shoe: Shoe) -> some View {
        Form {
            LabeledContent("**Marca**", value: shoe.brand)
            LabeledContent("**Tallas**", value: shoe.size.map { String($0) }.joined(separator: ", "))
            LabeledContent("**Precio**", value: "\(shoe.price) €")
            LabeledContent("**Descripción**", value: shoe.description)
            LabeledContent("**Tipo**", value: shoe.type)
            LabeledContent("**Materiales**", value: shoe.materials.joined(separator: ", "))
            LabeledContent("**Origen**", value: shoe.origin)
            LabeledContent("**Género**", value: shoe.gender)
            LabeledContent("**Peso**", value: "\(shoe.weight) kg")
            LabeledContent("**Colores**", value: shoe.colors.joined(separator: ", "))
            LabeledContent("**Garantía**", value: "\(shoe.warranty) años")
            LabeledContent("**Certificaciones**", value: shoe.certifications.joined(separator: ", "))
        }
        .navigationTitle(shoe.name)
        .background(Color.blue.opacity(0.4))
        .foregroundColor(.white)
    }
}
