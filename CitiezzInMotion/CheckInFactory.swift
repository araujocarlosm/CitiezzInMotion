//
//  CheckInFactory.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//

class CheckInFactory {
  static func create() -> CheckInView {
    return CheckInView(viewModel: createViewModel())
  }
  
  private static func createViewModel() -> CheckInViewModel {
    return CheckInViewModel(
      fetchCitiesUseCase: createUseCase(),
      sortCitiesUseCase: createSortUseCase()
    )
  }
  
  private static func createUseCase() -> FetchCitiesUseCaseProtocol {
    return FetchCitiesUseCase(repository: createRepository())
  }
  
  private static func createSortUseCase() -> SortCitiesUseCaseProtocol {
    return SortCitiesUseCase()
  }
  
  private static func createRepository() -> RemoteRepositoryProtocol {
    return CitiesRemoteRepository(dataSource: createDataSource())
  }
  
  private static func createDataSource() -> CitiesDataSourceProtocol {
    let apiService = ApiService(apiRequestManager: ApiRequestManager())
    return CitiesDataSource(apiService: apiService)
  }
  
  class MockFetchCitiesUseCase: FetchCitiesUseCaseProtocol {
    func execute() async throws -> [CityEntity] {
      let dtos = [
        CityDTO(country: "US", name: "Alabama", id: 3, coord: Coordinates(lon: 30, lat: 30)),
        CityDTO(country: "US", name: "Albuquerque", id: 4, coord: Coordinates(lon: 40, lat: 40)),
        CityDTO(country: "US", name: "Anaheim", id: 5, coord: Coordinates(lon: 50, lat: 50)),
        CityDTO(country: "US", name: "Arizona", id: 6, coord: Coordinates(lon: 60, lat: 60)),
        CityDTO(country: "AU", name: "Sydney", id: 7, coord: Coordinates(lon: 70, lat: 70)),
      ]
      return dtos.map { CityMapper.mapToDomain(from: $0) }
    }
  }
}
