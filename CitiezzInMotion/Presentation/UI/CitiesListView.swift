//
//  CitiesListView.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//
import SwiftUI

struct CitiesListView: View {
  @ObservedObject private var viewModel: CityListViewModel
  @State private var selection: CityEntity? = nil
  
  init(viewModel: CityListViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack {
          ForEach(viewModel.filteredCities, id: \.id) { city in
            Button(action: {
              selection = city
            }) {
              CityRow(city: city)
            }.navigationDestination(isPresented: .constant(selection?.id == city.id)) {
              MapFactory.createFromNavigation(selectedCity: city)
            }
            
            /*Button {
              cityData.selectedCity = city
            } label: {
              Text(city.name)
            }
            .navigationDestination(
              isPresented: .constant(cityData.selectedCity == city)
            ) {
              MapFactory.createFromNavigation(selectedCity: city)
            }*/
            
            //CityRow(city: city)
            /*NavigationLink(
              destination: MapFactory.createFromNavigation(selectedCity: city)
            ) {
              CityRow(city: city)
            }*/
          }
        }
        .padding()
      }
      //.navigationDestination(for: Int.self) { route in
        
      //}
      .navigationTitle("Citiezz In Motion")
      .searchable(text: $viewModel.searchTerm, prompt: "Search your city...")
      .onChange(of: viewModel.searchTerm, {
        viewModel.updateFilter()
      })
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
  CitiesListFactory.create(with: cities)
}
