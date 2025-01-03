//
//  CitiesDataSourceTests.swift
//  CitiezzInMotionTests
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

import XCTest
@testable import CitiezzInMotion

final class CitiesDataSourceTests: XCTestCase {
  private var dataSource : CitiesDataSource!
  private var mockApiService : MockApiService!
  
  override func setUp() {
    super.setUp()
    mockApiService = MockApiService()
    dataSource = CitiesDataSource(apiService: mockApiService)
  }
  
  override func tearDown() {
    dataSource = nil
    mockApiService = nil
    super.tearDown()
  }
  
  func testFetchCities() async throws {
    let mockedCitiesResponse = [
      CityDTO(country: "Spain", name: "Madrid", id: 1, coord: Coordinates(lon: -3.7033, lat: 40.4167)),
      CityDTO(country: "Spain", name: "Barcelona", id: 2, coord: Coordinates(lon: 2.1734, lat: 41.385)),
      CityDTO(country: "United Kingdom", name: "London", id: 3, coord: Coordinates(lon: -0.1278, lat: 51.5074))
    ]
    
    mockApiService.mockedResponse = mockedCitiesResponse
    
    let cities = try await dataSource.fetchCities()
    XCTAssertEqual(cities.count, mockedCitiesResponse.count)
    XCTAssertNotNil(cities.last?.coord)
  }
  
  func testFetchEmptyCities() async throws {
    mockApiService.mockedResponse = []
    
    let cities = try await dataSource.fetchCities()
    XCTAssertEqual(cities.count, 0)
  }
  
  func testFetchErrorCities() async throws {
    mockApiService.mockedResponse = nil
    
    do {
      let _ = try await dataSource.fetchCities()
    } catch {
      XCTAssertNotNil(error, "Error should not be nil")
      XCTAssertTrue(error is ApiError)
    }
  }
}
