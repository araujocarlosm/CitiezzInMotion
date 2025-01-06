//
//  Coordinates.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//
import CoreLocation

struct Coordinates: Codable {
    var lon, lat: Double
}

extension Coordinates {
  var toLocation : CLLocationCoordinate2D {
    CLLocationCoordinate2DMake(lat, lon)
  }
}
