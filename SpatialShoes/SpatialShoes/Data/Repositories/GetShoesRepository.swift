//
//  ShoeDataRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

protocol GetShoesRepositoryProtocol {
    var fileName: String? { get }
    var bundle: Bundle? { get }
    
    func loadShoes() throws -> [Shoe]
}

extension GetShoesRepositoryProtocol {
    
    // MARK: - Public Functions
    
    func loadShoes() throws -> [Shoe] {
        guard let fileName else { throw GetShoesDataError.filenameError }
        guard let bundle else { throw GetShoesDataError.bundleError }
        guard let result = try JSONManager.shared.load(fileName: fileName,
                                                       type: [Shoe].self,
                                                       bundle: bundle) else { throw GetShoesDataError.parsingError }
        return result
    }
}

// MARK: - GetShoesRepositoryProtocol

final class GetShoesRepository: GetShoesRepositoryProtocol {
    
    // MARK: - Properties
    
    var fileName: String? { "Shoes" }
    var bundle: Bundle? { Bundle(for: GetShoesRepository.self) }
}

// MARK: - GetShoesDataError

enum GetShoesDataError: Error {
    case filenameError
    case bundleError
    case parsingError
}
