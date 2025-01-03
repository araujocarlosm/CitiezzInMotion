//
//  CitiesRemoteRepositoryTests.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

import XCTest
@testable import CitiezzInMotion

final class CitiesRemoteRepositoryTests : XCTestCase {
  private var repository: CitiesRemoteRepository!
  private var mockDataSource: MockCitiesDataSource!
  
  override func setUp() {
    super.setUp()
    mockDataSource = MockCitiesDataSource()
    repository = CitiesRemoteRepository(dataSource: mockDataSource)
  }
  
  override func tearDown() {
    repository = nil
    mockDataSource = nil
    super.tearDown()
  }
  
  func testFetchCities() async throws {
    mockDataSource.mockedDTOResponse = [
      CityDTO(country: "Argentina", name: "Buenos Aires", id: 0, coord: Coordinates(lon: 0, lat: 0))
    ]
    
    let cities = try await repository.fetchCities()
    XCTAssertEqual(cities.count, 1)
    XCTAssertEqual(cities.first?.displayName, "Buenos Aires, Argentina")
    XCTAssertFalse(cities.first?.isFavorite ?? false)
  }
  
  func testFetchCitiesWithError() async throws {
    mockDataSource.shouldShowError = true
    
    do {
      let _ = try await repository.fetchCities()
    } catch {
      XCTAssertNotNil(error, "Error should not be nil")
    }
  }
}
