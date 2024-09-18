//
//  DetailPanelFactory.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 18/9/24.
//

import Foundation

final class DetailPanelFactory {
    static func make(with shoe: Shoe) -> DetailPanelView {
        .init(shoe: shoe)
    }
}
