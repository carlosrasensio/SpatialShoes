//
//  ShoeDataRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

protocol ShoeDataRepositoryProtocol {
    func loadShoes() throws -> [Shoe]
}

final class ShoeDataRepository {}

// MARK: - ShoeDataRepositoryProtocol

extension ShoeDataRepository: ShoeDataRepositoryProtocol {
    func loadShoes() throws -> [Shoe] {
        try JSONManager.load(fileName: Constants.fileName, type: [Shoe].self) ?? []
    }
}

// MARK: - Constants

private extension ShoeDataRepository {
    enum Constants {
        static let fileName = "Shoes"
    }
}
