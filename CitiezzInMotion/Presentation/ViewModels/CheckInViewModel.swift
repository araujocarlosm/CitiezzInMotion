//
//  CheckInViewModel.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//
import Foundation
import SwiftUI

class CheckInViewModel : ObservableObject {
  @Published var isLoading: Bool = false
  @Published var isPortrait: Bool = true
  @Published var cities: [CityEntity] = []
  
  private var deviceOrientation: UIDeviceOrientation?
  private let fetchCitiesUseCase: FetchCitiesUseCaseProtocol
  private let sortCitiesUseCase: SortCitiesUseCaseProtocol
  
  init (fetchCitiesUseCase: FetchCitiesUseCaseProtocol, sortCitiesUseCase: SortCitiesUseCaseProtocol) {
    self.fetchCitiesUseCase = fetchCitiesUseCase
    self.sortCitiesUseCase = sortCitiesUseCase
    setupOrientationObserver()
    updateOrientation()
  }
  
  func onAppear() {
    Task {
      await fetchCities()
    }
  }
  
  @MainActor
  func fetchCities() async {
    isLoading = true
    defer { isLoading = false }
    
    do {
      cities = try await fetchCitiesUseCase.execute()
      sortCities()
    } catch {
      print("Error fetching cities: \(error)")
    }
  }
  
  func sortCities() {
    cities = sortCitiesUseCase.execute(cities: self.cities, sortCriteria: .ascending)
  }
  
  private func setupOrientationObserver() {
    NotificationCenter.default.addObserver(
      forName: UIDevice.orientationDidChangeNotification,
      object: nil,
      queue: .main
    ) { [weak self] _ in
      self?.updateOrientation()
    }
  }
  
  func updateOrientation() {
    deviceOrientation = UIDevice.current.orientation
    isPortrait = deviceOrientation?.isPortrait ?? false
  }
  
  private func clearOrientationObserver() {
    NotificationCenter.default.removeObserver(self)
  }
  
  deinit {
    clearOrientationObserver()
  }
}
