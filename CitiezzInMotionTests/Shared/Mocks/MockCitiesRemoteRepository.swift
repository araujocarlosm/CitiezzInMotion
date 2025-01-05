//
//  MockCitiesRemoteRepository.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 4/01/25.
//
import Foundation
@testable import CitiezzInMotion

class MockCitiesRemoteRepository : RemoteRepositoryProtocol {
  var mockedDataSourceResponse: [CityEntity] = []
  var shouldShowError = false
  
  func fetchCities() async throws -> [CityEntity] {
    if shouldShowError {
      throw NSError(domain: "MockCitiesRemoteRepository", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mocked error response"])
    }
    return mockedDataSourceResponse
  }
}
