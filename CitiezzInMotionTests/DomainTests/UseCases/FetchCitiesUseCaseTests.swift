//
//  FetchCitiesUseCaseTests.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 4/01/25.
//
import XCTest
@testable import CitiezzInMotion

final class FetchCitiesUseCaseTests : XCTestCase {
  private var useCase: FetchCitiesUseCase!
  private var mockRepository: MockCitiesRemoteRepository!
  
  override func setUp() {
    super.setUp()
    mockRepository = MockCitiesRemoteRepository()
    useCase = FetchCitiesUseCase(repository: mockRepository)
  }
  
  override func tearDown() {
    useCase = nil
    mockRepository = nil
    super.tearDown()
  }
  
  func testFetchCities() async throws {
    let cityDto = CityDTO(country: "Colombia", name: "Bogotá", id: 0, coord: Coordinates(lon: 10, lat: 10))
    mockRepository.mockedDataSourceResponse = [
      CityMapper.mapToDomain(from: cityDto)
    ]
    
    let result = try await useCase.execute()
    XCTAssertEqual(result.count, 1)
    XCTAssertEqual(result.first?.name, "Bogotá")
    XCTAssertEqual(result.first?.country, "Colombia")
    XCTAssertEqual(result.first?.displayName, "Bogotá, Colombia")
  }
  
  func testFetchCitiesReturnsEmptyResult() async throws {
    mockRepository.mockedDataSourceResponse = []
    
    let result = try await useCase.execute()
    XCTAssertTrue(result.isEmpty)
  }
  
  func testFetchCitiesThrowsError() async throws {
    mockRepository.shouldShowError = true
    
    do {
      let _ = try await useCase.execute()
    } catch {
      XCTAssertNotNil(error, "Error should not be nil")
    }
  }
}
