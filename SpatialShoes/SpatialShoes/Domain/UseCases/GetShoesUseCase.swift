//
//  GetShoesUseCase.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import Foundation

final class GetShoesUseCase {
    
    // MARK: - Public Properties

    @Published var shoes: [Shoe] = []

    
    // MARK: - Private Properties
    
    private var repository: GetShoesRepository

    // MARK: - Initializer

    init(repository: GetShoesRepository) {
        self.repository = repository
    }
    
    // MARK: - Public Funtions
    
    func execute() throws {
        do {
            try loadShoes()
        } catch let error as GetShoesDataError {
            throw error.mapToDomainError()
        }
    }
}

// MARK: - Private Functions

private extension GetShoesUseCase {
    func loadShoes(fileName: String? = Constants.fileName) throws {
        shoes = try repository.loadShoes(fileName: fileName, bundle: Bundle(for: JSONManager.self))
    }
}

// MARK: - Constants

private extension GetShoesUseCase {
    enum Constants {
        static let fileName = "Shoes"
    }
}

// MARK: - GetShoesDomainError

enum GetShoesDomainError: Error {
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

// MARK: - GetShoesDomainError.Localizables

private extension GetShoesDomainError {
    enum Localizables {
        enum Errors {
            static let fileName = "Error con el nombre del fichero JSON"
            static let bundle = "Error con el bundle"
            static let parsing = "Error cargando el fichero JSON"
        }
    }
}

// MARK: - GetShoesDataError

private extension GetShoesDataError {
    func mapToDomainError() -> GetShoesDomainError {
        switch self {
        case .filenameError: .filenameError
        case .bundleError: .bundleError
        case .parsingError: .parsingError
        }
    }
}
