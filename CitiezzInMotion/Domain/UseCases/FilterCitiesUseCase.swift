//
//  FilterCitiesUseCase.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 4/01/25.
//

protocol FilterCitiesUseCaseProtocol {
  func execute(cities: [CityEntity], filter: String) -> [CityEntity]
}

final class FilterCitiesUseCase : FilterCitiesUseCaseProtocol {
  func execute(cities: [CityEntity], filter: String) -> [CityEntity] {
    let formatted = filter.filteringCriteria
    
    guard !formatted.isEmpty else { return cities }
    
    return cities.filter {
      $0.formattedNameForFiltering.hasPrefix(formatted) || $0.formattedCountryForFiltering.hasPrefix(formatted)
    }
  }
}
