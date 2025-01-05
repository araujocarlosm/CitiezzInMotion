//
//  RemoteRepository+Protocol.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

protocol RemoteRepositoryProtocol {
  func fetchCities() async throws -> [CityEntity]
}
