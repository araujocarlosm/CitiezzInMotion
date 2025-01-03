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
    let cities = try await dataSource.fetchCities().map { dto in
      return CityMapper.mapToDomain(from: dto)
    }
    return cities
  }
}
