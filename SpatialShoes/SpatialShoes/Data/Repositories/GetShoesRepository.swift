//
//  ShoeDataRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

final class GetShoesRepository {
    func loadShoes(fileName: String?, bundle: Bundle?) throws -> [Shoe] {
        guard let fileName else { throw GetShoesDataError.filenameError }
        guard let bundle else { throw GetShoesDataError.bundleError }
        guard let result = try JSONManager.shared.load(fileName: fileName,
                                                       type: [Shoe].self,
                                                       bundle: bundle) else { throw GetShoesDataError.parsingError }
        return result
    }
}

// MARK: - ShoeDataError

enum GetShoesDataError: Error {
    case filenameError
    case bundleError
    case parsingError
}
