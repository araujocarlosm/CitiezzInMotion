//
//  CitiesListFactory.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//

import Foundation

class CitiesListFactory {
  static func create(with cities: [CityEntity]) -> CitiesListView {
    return CitiesListView(viewModel: createViewModel(cities: cities))
  }
  
  private static func createViewModel(cities: [CityEntity]) -> CityListViewModel {
    return CityListViewModel(filterCitiesUseCase: createUseCase(), cities: cities)
  }
  
  private static func createUseCase() -> FilterCitiesUseCaseProtocol {
    return FilterCitiesUseCase()
  }
}
