//
//  CheckInView.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 5/01/25.
//

import SwiftUI

struct CheckInView: View {
  @ObservedObject private var viewModel: CheckInViewModel
  
  var cities : [CityEntity] { viewModel.cities }
  
  init(viewModel: CheckInViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    Group {
      if viewModel.isLoading {
        ProgressView()
      } else {
        if viewModel.isPortrait {
          CitiesListView(cities: cities)
        } else {
          MapView(cities: cities)
        }
      }
    }.onAppear() {
      viewModel.onAppear()
    }
  }
}

#Preview {
  CheckInFactory.create()
}
