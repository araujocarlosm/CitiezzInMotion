//
//  MapView.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//

import SwiftUI
import MapKit

struct MapView: View {
  @ObservedObject private var viewModel: MapViewModel
  
  init(viewModel: MapViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    HStack {
      if viewModel.shouldShowList {
        NavigationStack {
          ScrollView {
            LazyVStack {
              ForEach(viewModel.filteredCities, id: \.id) { city in
                Button(action: {
                  viewModel.selectedCity = city
                }) {
                  CityRow(city: city)
                }
              }
            }
          }
          .searchable(text: $viewModel.searchTerm, prompt: "Search your city...")
          .onChange(of: viewModel.searchTerm, {
            viewModel.updateFilter()
          })
          .onAppear {
            viewModel.onAppear()
          }
        }
      }
      Map {
        if let selectedCity = viewModel.selectedCity {
          Marker(
            selectedCity.displayName,
            coordinate: selectedCity.coord.toLocation
          )
        }
      }
    }
  }
}

#Preview {
  let dtos = [
    CityDTO(country: "US", name: "Alabama", id: 3, coord: Coordinates(lon: 30, lat: 30)),
    CityDTO(country: "US", name: "Albuquerque", id: 4, coord: Coordinates(lon: 40, lat: 40)),
    CityDTO(country: "US", name: "Anaheim", id: 5, coord: Coordinates(lon: 50, lat: 50)),
    CityDTO(country: "US", name: "Arizona", id: 6, coord: Coordinates(lon: 60, lat: 60)),
    CityDTO(country: "AU", name: "Sydney", id: 7, coord: Coordinates(lon: 70, lat: 70)),
  ]
  let cities = dtos.map { CityMapper.mapToDomain(from: $0) }
  MapFactory.create(with: cities)
}
