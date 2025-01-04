//
//  CityEntity.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

import Foundation

struct CityEntity : Identifiable {
  let city: CityDTO
  let isFavorite: Bool = false
  
  var id: Int { city.id }
  var name: String { city.name }
  var country: String { city.country }
  var coord: Coordinates { city.coord }
  
  var displayName: String {
    "\(name), \(country)"
  }
}
