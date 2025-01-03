//
//  CitiesDataSource+Protocol.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

protocol CitiesDataSourceProtocol {
  func fetchCities() async throws -> [CityDTO]
}
