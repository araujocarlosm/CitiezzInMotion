//
//  CityRow.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//
import SwiftUI

struct CityRow: View {
  @State var showingCityDetails = false
  
  let city: CityEntity
  var isFavorite: Bool {
    city.isFavorite
  }
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(city.displayName)
          .font(.headline)
          .foregroundStyle(Color.primary)
        Text(city.displayCoordinates)
          .font(.subheadline)
          .foregroundStyle(Color.secondary)
      }
      Spacer()
      HStack {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
          .foregroundColor(isFavorite ? .red : .gray).onTapGesture {
            
          }
        Button(action: {
          showingCityDetails.toggle()
        }) {
          Image(systemName: "info.circle")
            .foregroundColor(.blue)
        }
      }
    }
    .padding([.horizontal, .vertical], 10)
    .background(Color.gray.opacity(0.1)).clipShape(.buttonBorder)
    .sheet(isPresented: $showingCityDetails) {
      CityDetailView(city: city).presentationDetents([.fraction(0.3), .medium])
    }
  }
}

#Preview {
  CityRow(city: CityEntity(city: CityDTO(country: "US", name: "Albuquerque", id: 4, coord: Coordinates(lon: 40, lat: 40))))
}
