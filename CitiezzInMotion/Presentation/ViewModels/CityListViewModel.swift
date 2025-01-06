//
//  CityListViewModel.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//
import SwiftUI

class CityListViewModel: ObservableObject {
  private let filterCitiesUseCase: FilterCitiesUseCaseProtocol
  @Published var searchTerm: String = ""
  @Published private(set) var filteredCities: [CityEntity] = []
  
  private let cities: [CityEntity]
  
  init(filterCitiesUseCase: FilterCitiesUseCaseProtocol, cities: [CityEntity]) {
    self.filterCitiesUseCase = filterCitiesUseCase
    self.cities = cities
    filteredCities = cities
  }
  
  func updateFilter() {
    guard !searchTerm.isEmpty else {
      filteredCities = cities
      return
    }
    filteredCities = filterCitiesUseCase.execute(cities: cities, filter: searchTerm)
  }
  
  func onAppear() {
    filteredCities = cities
  }
}
