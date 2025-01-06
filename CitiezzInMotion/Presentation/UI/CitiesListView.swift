//
//  CitiesListView.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//
import SwiftUI

struct CitiesListView: View {
  let cities : [CityEntity]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack {
          ForEach(cities, id: \.id) { city in
            NavigationLink(
              destination: MapView(selectedCity: city, shouldShowList: false)
            ) {
              CityRow(city: city)
            }
          }
        }.padding()
      }
      .navigationTitle("Citiezz In Motion")
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
  CitiesListView(cities: cities)
}
