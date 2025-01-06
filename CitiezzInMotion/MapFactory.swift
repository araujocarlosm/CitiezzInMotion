//
//  MapFactory.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 6/01/25.
//

class MapFactory {
  static func create(with cities: [CityEntity]) -> MapView {
    return MapView(viewModel: createViewModel(cities: cities))
  }
  
  static func createFromNavigation(selectedCity: CityEntity) -> MapView {
    return MapView(viewModel: createViewModelForNavigation(selectedCity))
  }
  
  private static func createViewModel(cities: [CityEntity]) -> MapViewModel {
    return MapViewModel(filterCitiesUseCase: createUseCase(), cities: cities)
  }
  
  private static func createViewModelForNavigation(_ selectedCity: CityEntity) -> MapViewModel {
    let viewModel = createViewModel(cities: [])
    viewModel.selectedCity = selectedCity
    viewModel.shouldShowList = false
    return viewModel
  }
  
  private static func createUseCase() -> FilterCitiesUseCaseProtocol {
    return FilterCitiesUseCase()
  }
}
