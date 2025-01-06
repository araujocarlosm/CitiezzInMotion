//
//  MapView.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//

import SwiftUI
import MapKit

struct MapView: View {
  @State var selectedCity: CityEntity?
  var cities : [CityEntity] = []
  var shouldShowList = true
  
  var body: some View {
    ZStack {
      Map {
        if let selectedCity {
          Marker(
            selectedCity.displayName,
            coordinate: selectedCity.coord.toLocation
          )
        }
      }
      if shouldShowList {
        HStack {
          GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 16)
              .frame(maxWidth: geometry.size.width * 0.35)
              .overlay {
                ScrollView {
                  LazyVStack {
                    ForEach(cities, id: \.id) { city in
                      Button(action: { selectedCity = city }) {
                        CityRow(city: city)
                      }
                    }
                  }.padding()
                }.background()
              }.ignoresSafeArea()
          }
          Spacer()
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
  MapView(cities: cities)
}
