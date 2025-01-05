//
//  SortCitiesUseCase.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 4/01/25.
//

protocol SortCitiesUseCaseProtocol {
  func execute(cities: [CityEntity], sortCriteria: SortCriteria) -> [CityEntity]
}

final class SortCitiesUseCase : SortCitiesUseCaseProtocol {
  func execute(cities: [CityEntity], sortCriteria: SortCriteria = .ascending) -> [CityEntity] {
    return cities.sorted {
      switch sortCriteria {
      case .ascending: return $0.displayName < $1.displayName
      case .descending: return $1.displayName < $0.displayName
      }
    }
  }
}

enum SortCriteria {
  case ascending
  case descending
}
