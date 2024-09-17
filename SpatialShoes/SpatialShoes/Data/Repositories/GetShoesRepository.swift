//
//  ShoeDataRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

protocol GetShoesRepositoryProtocol {
    var bundle: Bundle? { get }
    
    func loadShoes(fileName: String?) throws -> [Shoe]
}

final class GetShoesRepository {
    
    // MARK: - Internal Properties
    
    internal let bundle: Bundle?
    
    // MARK: - Initializer

    init(bundle: Bundle? = Bundle(for: GetShoesRepository.self)) {
        self.bundle = bundle
    }
}

// MARK: - GetShoesRepositoryProtocol

extension GetShoesRepository: GetShoesRepositoryProtocol {
    func loadShoes(fileName: String?) throws -> [Shoe] {
        guard let fileName else { throw GetShoesDataError.filenameError }
        guard let bundle else { throw GetShoesDataError.bundleError }
        guard let result = try JSONManager.shared.load(fileName: fileName,
                                                       type: [Shoe].self,
                                                       bundle: bundle) else { throw GetShoesDataError.parsingError }
        return result
    }
}

// MARK: - GetShoesDataError

enum GetShoesDataError: Error {
    case filenameError
    case bundleError
    case parsingError
}
