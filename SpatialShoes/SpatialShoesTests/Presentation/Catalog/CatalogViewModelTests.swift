//
//  CatalogViewModelTests.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import XCTest
@testable import SpatialShoes

final class CatalogViewModelTests: XCTestCase {

    // MARK: - Pivate Properties
    
    private var sut: CatalogViewModel!
    private var useCase: GetShoesUseCase!
    private var repository: GetShoesRepositoryProtocol!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        repository = MockGetShoesRepository()
        useCase = GetShoesUseCase(repository: repository)
        sut = CatalogViewModel(getShoesUseCase: useCase)
    }
    
    override func tearDown() {
        sut = nil
        useCase = nil
        repository = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testLoadShoesWithSuccess() {
        // When
        sut.loadShoes()
        
        // Then
        XCTAssertFalse(sut.shoes.isEmpty)
        XCTAssertEqual(sut.shoes.count, 3)
    }
}
