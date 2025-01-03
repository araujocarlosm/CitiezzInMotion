//
//  CitiesDataSource.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

enum Endpoint : String {
  case cities = "https://gist.githubusercontent.com/hernan-uala/dce8843a8edbe0b0018b32e137bc2b3a/raw/0996accf70cb0ca0e16f9a99e0ee185fafca7af1/cities.json"
}

class CitiesDataSource : CitiesDataSourceProtocol {
  private let apiService: ApiServiceProtocol
  
  init(apiService: ApiServiceProtocol) {
    self.apiService = apiService
  }
  
  func fetchCities() async throws -> [CityDTO] {
    return try await apiService.perform(Endpoint.cities.rawValue)
  }
}
