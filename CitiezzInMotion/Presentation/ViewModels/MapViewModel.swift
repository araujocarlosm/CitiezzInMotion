//
//  MapViewModel.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 6/01/25.
//

import SwiftUI

class MapViewModel : CityListViewModel {
  @Published var selectedCity: CityEntity?
  @Published var shouldShowList = true
}
