//
//  GetShoesUseCaseTests.swift
//  SpatialShoesTests
//
//  Created by Carlos Rodriguez Asensio on 17/9/24.
//

import XCTest
@testable import SpatialShoes

final class GetShoesUseCaseTests: XCTestCase {

    // MARK: - Pivate Properties
    
    private var sut: GetShoesUseCase!
    private var repository: GetShoesRepositoryProtocol!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        repository = MockGetShoesRepository()
        sut = GetShoesUseCase(repository: repository)
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testExecuteWithSuccess() {
        do {
            // When
            try sut.execute()
            
            // Then
            XCTAssertFalse(sut.shoes.isEmpty)
            XCTAssertEqual(sut.shoes.count, 3)
        } catch {
            XCTFail("❌ Error al ejecutar el caso de uso")
        }
    }
}
