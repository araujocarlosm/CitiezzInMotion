//
//  CitiesRemoteRepository.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

class CitiesRemoteRepository : RemoteRepositoryProtocol {
  private let dataSource: CitiesDataSourceProtocol
  
  init(dataSource: CitiesDataSourceProtocol) {
    self.dataSource = dataSource
  }
  
  func fetchCities() async throws -> [CityEntity] {
    return try await dataSource.fetchCities().map { CityMapper.mapToDomain(from: $0) }
  }
}
