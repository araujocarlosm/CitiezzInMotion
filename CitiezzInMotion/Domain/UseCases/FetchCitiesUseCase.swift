//
//  FetchCitiesUseCase.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 4/01/25.
//

protocol FetchCitiesUseCaseProtocol {
  func execute() async throws -> [CityEntity]
}

final class FetchCitiesUseCase : FetchCitiesUseCaseProtocol {
  private let repository: RemoteRepositoryProtocol
  
  init(repository: RemoteRepositoryProtocol) {
    self.repository = repository
  }
  
  func execute() async throws -> [CityEntity] {
    return try await repository.fetchCities()
  }
}
