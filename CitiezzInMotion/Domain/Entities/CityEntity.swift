//
//  CityEntity.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

import Foundation

struct CityEntity : Identifiable, Hashable {
  let city: CityDTO
  let isFavorite: Bool = false
  
  var id: Int { city.id }
  var name: String { city.name }
  var country: String { city.country }
  var coord: Coordinates { city.coord }
}

extension CityEntity {
  var displayName: String {
    "\(name), \(country)"
  }
  
  var displayCoordinates: String {
    "Coordinates: \(coord.lat), \(coord.lon)"
  }
  
  var formattedNameForFiltering: String { name.filteringCriteria }
  var formattedCountryForFiltering: String { country.filteringCriteria }
}
