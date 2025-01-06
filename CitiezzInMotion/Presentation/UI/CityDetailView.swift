//
//  CityDetailView.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 6/01/25.
//
import SwiftUI

struct CityDetailView: View {
  let city: CityEntity
  
  var body: some View {
    VStack {
      Text("City: \(city.name)")
      Text("Country: \(city.country)")
      Text("Coordinates: \(city.coord.lat), \(city.coord.lon)")
    }
    .padding()
    .navigationTitle(city.name)
  }
}
