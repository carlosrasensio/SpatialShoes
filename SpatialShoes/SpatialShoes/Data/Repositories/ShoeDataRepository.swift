//
//  ShoeDataRepository.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 13/9/24.
//

import Foundation

final class ShoeDataRepository {
    func loadShoes(fileName: String?, bundle: Bundle?) throws -> [Shoe] {
        guard let fileName else { throw ShoeDataError.filenameError }
        guard let bundle else { throw ShoeDataError.bundleError }
        guard let result = try JSONManager.shared.load(fileName: fileName,
                                                       type: [Shoe].self,
                                                       bundle: bundle) else { throw ShoeDataError.parsingError }
        return result
    }
}

// MARK: - ShoeDataError

enum ShoeDataError: Error {
    case filenameError
    case bundleError
    case parsingError
    
    var message: String {
        switch self {
        case .filenameError: Localizables.Errors.fileName
        case .bundleError: Localizables.Errors.bundle
        case .parsingError: Localizables.Errors.parsing
        }
    }
}

// MARK: - ShoeDataError.Localizables

private extension ShoeDataError {
    enum Localizables {
        enum Errors {
            static let fileName = "Error con el nombre del fichero JSON"
            static let bundle = "Error con el bundle"
            static let parsing = "Error cargando el fichero JSON"
        }
    }
}
