//
//  FavoritesLocalRepository+Protocol.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

protocol LocalRepositoryProtocol {
  func save(_ favorite: CityEntity)
  func remove(_ favorite: CityEntity)
  func fetchAll() -> [CityEntity]
}
