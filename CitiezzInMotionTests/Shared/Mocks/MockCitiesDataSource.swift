//
//  MockCitiesDataSource.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//
import Foundation
@testable import CitiezzInMotion

class MockCitiesDataSource: CitiesDataSourceProtocol {
  var mockedDTOResponse : [CityDTO] = []
  var shouldShowError = false
  
  func fetchCities() async throws -> [CityDTO] {
    if shouldShowError {
      throw NSError(domain: "MockCitiesDataSource", code: 0, userInfo: [NSLocalizedDescriptionKey: "Mocked error response"])
    }
    return mockedDTOResponse
  }
}
