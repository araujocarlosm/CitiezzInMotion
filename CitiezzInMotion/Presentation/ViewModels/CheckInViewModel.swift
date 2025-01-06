//
//  CheckInViewModel.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//
import Foundation
import SwiftUI

class CityViewModel : ObservableObject {
  @Published var selectedCity: CityEntity?
  
  func selectCity(city: CityEntity) {
    selectedCity = city
  }
  
  func clearCitySelection() {
    selectedCity = nil
  }
}

class CheckInViewModel : ObservableObject {
  @Published var isLoading: Bool = false
  @Published var isPortrait: Bool = true
  @Published var cities: [CityEntity] = []
  
  private var deviceOrientation: UIDeviceOrientation?
  private let fetchCitiesUseCase: FetchCitiesUseCaseProtocol
  
  init (fetchCitiesUseCase: FetchCitiesUseCaseProtocol) {
    self.fetchCitiesUseCase = fetchCitiesUseCase
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
    } catch {
      print("Error fetching cities: \(error)")
    }
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
